# Code Challenge

![License](https://img.shields.io/github/license/komidore64/code-challenge)
![GitHub repo size](https://img.shields.io/github/repo-size/komidore64/code-challenge)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/komidore64/code-challenge/tests)

## Deck of Cards

Your assignment is to code a set of classes that represent a deck of
poker-style playing cards. Fifty-two playing cards in four suits: hearts,
spades, clubs, diamonds with face values of Ace, 2-10, Jack, Queen, and
King.

Within one of your classes, you must provide two operations:

1. `shuffle()`: Shuffle returns no value, but results in the cards in the
   deck being randomly permuted. Please do not use library-provided
   "shuffle" operations to implement this function. You may use
   library-provided random number generators in your solution if needed.

1. `dealOneCard()`: This function should return one card from the deck to
   the caller. Specifically, a call to `shuffle()` followed by 52 calls to
   `dealOneCard()` should result in the caller being provided all 52 cards
   of the deck in a random order. If the caller then makes a 53rd call to
   `dealOneCard()`, no card is dealt.

_Ruby doesn't traditionally use camelCase, so I opted to use
`deal_one_card()` instead._

## Check it out!

This solution assumes [RVM](https://rvm.io) is present.

```sh
git clone https://github.com/komidore64/code-challenge.git
cd code-challenge
bundle install
```

Run `rake test` for unit tests.

Run `rake lint` to check code styling.

Run `./repl` to launch a [Pry](https://github.com/pry/pry) session with
this solution already loaded to directly interact with the classes/objects
via Ruby.
