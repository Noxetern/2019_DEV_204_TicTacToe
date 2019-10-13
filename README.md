# 2019_DEV_204_TicTacToe

A simple Tic Tac Toe game made in swift

## Rules

- X always goes first.

- Players cannot play on a played position.

- Players alternate placing X’s and O’s on the board until either:

	- One player has three in a row, horizontally, vertically or diagonally

	- All nine squares are filled.

- If a player is able to draw three X’s or three O’s in a row, that player wins.

- If all nine squares are filled and neither player has three in a row, the game is a draw.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Have SwiftLint installed, either through Homebrew or download from the latest [GitHub release](https://github.com/realm/SwiftLint/releases)

```
brew install swiftlint
```

### Installing

Simply navigate to the projects location through terminal and perform:  

```
pod install
```

This will download all binaries and dependencies declared in the `Podfile`

## Running the tests

In Xcode:

```
CMD + U
```

This will automatically run all the Unit and UI tests

## Running the application

In Xcode:

```
CMD + R
```

This will open the iOS simulator and run the application

## Useful links

- [SwiftLint](https://github.com/realm/SwiftLint)
