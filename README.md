# Solver for the Pirate Riddle with N pirates

## The problem

Below is the Pirate riddle in its most common form, with 5 pirates. Adapted
from [Popular
Mechanics](https://www.popularmechanics.com/science/math/a25367/riddle-of-the-week-17/).

> Five pirates are to divide 100 gold coins among themselves. The pirates have a
> system that they are sworn to follow. It works like this: The captain proposes
> a way to divide the coins. Then all the pirates, including the captain, vote on
> whether or not to accept the proposal. If a majority accept or there is a tie
> they divvy the coins as proposed. Otherwise the captain is killed and the next
> ranking pirate takes over as captain. The new captain makes a proposal and they
> vote again with the same rules.
>
> There are a few important things to know about the pirates. First, they will
> make their decisions according to whatever will net them the most money without
> getting them killed. Second, all other things being equal, they would prefer to
> kill the captain. Third, they do not trust each other in the slightest and will
> make no agreements amongst themselves to determine how they vote. Finally, the
> pirates are perfect logicians, capable of considering all possible outcomes.
>
> Let's consider the pirates A, B, C, D and E, with A being the captain and the
> rest of the pirates ordered by rank. How should Pirate A suggest they divvy up
> the coins?

The code in this repo solves this riddle with an arbitrary number of pirates.

## Scripts

Run the solver using [stack](https://docs.haskellstack.org/en/stable/):

```sh
stack build
stack exec pirate-riddle-exe
```

Run the [Hspec](https://hspec.github.io) test suite:

```sh
stack test
```
