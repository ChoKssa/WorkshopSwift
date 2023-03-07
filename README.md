# Hub Workshop - Swift

## Installing Swift

If you haven't already installed Swift, [install it](https://www.swift.org/download/) :

- On Fedora, use `dnf install swiftlang`
- On macOS, install Xcode

If you use VSCode, you can install the official plugins for Swift.

## 0. Hello, World!

**file**: hello.swift

Create a `hello.swift` script that prints 10 times a hello world to the standard output. You are expected to use a loop.
.
## 1. Toilets

**file**: toilets.swift

Clone this repository, and look at the `toilets.json` file. This file includes information about some public toilets in Paris.

Using [Codable](https://www.hackingwithswift.com/articles/119/codable-cheat-sheet), parse the JSON into a `Toilet` structure.

> **Note**: You can use `Data(contentsOf:)` to load a json from a local file.
