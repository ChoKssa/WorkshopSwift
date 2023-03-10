# Hub Workshop - Swift

## Installing Swift

If you haven't already installed Swift, [install it](https://www.swift.org/download/) :

- On Fedora, use `dnf install swift-lang`
- On macOS, install Xcode

If you use VSCode, you can install the official plugins for Swift.

## 0. Hello, World!

**File**: hello.swift

Create a `hello.swift` script that prints 10 times a hello world to the standard output. You are expected to use a loop.

> **Note**: Check out [The Swift Programming Language](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow)

## 1. Toilets

**File**: toilets.swift

Clone this repository, and look at the `toilets1.json` file. This file includes information about some public toilets in Paris.

Using [Codable](https://www.hackingwithswift.com/articles/119/codable-cheat-sheet), parse the JSON into a `Toilet` structure.

> **Note**: You can use `Data(contentsOf:)` to load a json from a local file.

Print the address of each toilet.

## 2. Adapt

**File**: toilets.swift

Modify your code to work with `toilets2.json`. You should reuse your `Toilet` structure.

> **Note**: not all the fields have to be in your structures, only the fields that you need for your program

## 3. Network

**File**: toilets.swift

Modify your code to get the data from `https://opendata.paris.fr/api/records/1.0/search/?dataset=sanisettesparis&q=&facet=type&facet=statut&facet=arrondissement&facet=horaire&facet=acces_pmr&facet=relais_bebe`

The documentation of the API can be found [here](https://opendata.paris.fr/explore/dataset/sanisettesparis/information/?disjunctive.type&disjunctive.statut&disjunctive.arrondissement&disjunctive.horaire&disjunctive.acces_pmr&disjunctive.relais_bebe).

## 4. Package

Use `swift package init` to create a Swift Package. Move your code to the Swift Package. You are expected to add a `executable` target to your `Package.swift`.

You should be able to build with `swift build` and run your executable with `swift run`.

> **Note**: `swift package init --help`

## 5. Swift Argument Parser

Add a dependency to [Swift Argument Parser](https://github.com/apple/swift-argument-parser). You must use it to parse a options to pass to the API.

An error should be shown if an entered value is not valid.

### Example

```
$ swift run Toilets --help
USAGE: toilets [--rows <rows>] [--start <start>] [--type <type>] [--near <near>] [--pmr]

OPTIONS:
  --rows <rows>           The number of rows to show (default: 10)
  --start <start>         The number of initial rows to skip (default: 0)
  --type <type>           The type of toilet to search for
  --near <near>           The GPS coordinates and distance for the geofilter
  --pmr                   Only show accessible toilets
  -h, --help              Show help information.
  
$ swift run Toilets --rows 3 --start 7 --near 48.819,2.362,5000
27  AVENUE D IVRY
1  RUE EMILE LEVASSOR
87  AVENUE D ITALIE

$ swift run Toilets --rows hello
Error: The value 'hello' is invalid for '--rows <rows>'
Help:  --rows <rows>  The number of rows to show
Usage: toilets [--rows <rows>] [--start <start>] [--type <type>] [--near <near>] [--pmr]
  See 'toilets --help' for more information.

```

## 6. Protocols

To make your code more robust, and to make your code more easily testable, we can use [Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols).

Protocols describe a behavior, so that multiple structures can behave in a similar way while staying different.

Complete the following class, implementing the `ToiletInteractor`.
```swift
protocol ToiletIteractor {
    func getToilets(rows: Int, start: Int, type: String?, near: String?, pmr: Bool) throws -> [Toilet]
}

class APIToiletInteractor: ToiletInteractor {
    func getToilets(rows: Int, start: Int, type: String?, near: String?, pmr: Bool) throws -> [Toilet] {
        (...)
    }
}
```

Your command line tool should create an instance of this `APIToiletInteractor` class and call its `getToilets` function.

## 7. Local implementation

If your computer is offline, using the API won't work. However, we can still use `toilets2.json`! It is not updated as frequently as the API, but it can work as a backup.

Create a `LocalToiletInteractor` class, which implements `ToiletInteractor` too, but uses a local file, such as `toilets1.json` or `toilets2.json` (your choice).

Your `LocalToiletInteractor` could use different methods on [Array](https://developer.apple.com/documentation/swift/array/) to skip `start` elements, filter by `type`, and keep `rows` elements.
