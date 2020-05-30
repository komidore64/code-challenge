# Code Challenge

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

## Poking around

This repo assumes [RVM](https://rvm.io) is present, but isn't strictly
necessary.

```sh
rvm install 2.7
# stuff happens

cd .
# this _should_ initialize the RVM gemset (based on the contents of
# .ruby-version and .ruby-gemset)

bundle install
```

Run `rake test` for unit tests.

Run `rake lint` to check code styling.

Run `./repl` to launch a [Pry](https://github.com/pry/pry) session with **Code
Challenge** already loaded to directly interact with the classes/objects via
Ruby.
