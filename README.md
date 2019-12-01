# Advent Of Code 2019 in Elixir

This year, I want to try a new language for solving the [Advent of Code](https://adventofcode.com/2019/) puzzles, and it's gonna be [Elixir](https://elixir-lang.org/).

I took the first baby steps in Elixir this summer. Consequently, I've forgotten most of the stuff I learned from the [Exercism](https://exercism.io/) Elixir track. D'oh!

I'm still struggling with the right structure of the project, what to put where, how to call or execute the single modules.

For now, it's

```shell script
mix test
```

to execute the unit tests.

To run the puzzle solver for each of the two parts of a day, I use a `runner` script (but there has to be a more elegant way):

```shell script
mix run lib/day1/runner.exs
```