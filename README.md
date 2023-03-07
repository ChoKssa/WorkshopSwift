# Hub Workshop - Swift

## Installing Swift

If you haven't already installed Swift, [install it](https://www.swift.org/download/) :

- On Fedora, use `dnf install swiftlang`
- On macOS, install Xcode

If you use VSCode, you can install the official plugins for Swift.

## 0. Hello, World!

**File**: hello.swift

Create a `hello.swift` script that prints 10 times a hello world to the standard output. You are expected to use a loop.

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

Add a dependency to [Swift Argument Parser](https://github.com/apple/swift-argument-parser). You can use it to parse a `--rows` option to pass to the API.

An error should be shown if `rows` is not valid. The default value for `rows` should be 10.

## 6. More Arguments

Add more options to the program, to be passed to the API.

The following help message should be shown:

```
$ swift run Toilets --help
Build complete! (0.57s)
USAGE: toilets [--rows <rows>] [--start <start>] [--type <type>] [--near <near>] [--pmr]

OPTIONS:
  --rows <rows>           The number of rows to show (default: 10)
  --start <start>         The number of initial rows to skip (default: 0)
  --type <type>           The type of toilet to search for
  --near <near>           The GPS coordinates and distance for the geofilter
  --pmr                   Only show accessible toilets
  -h, --help              Show help information.
```
