defmodule Day1.SolutionTest do
  use ExUnit.Case
  alias Day1.Solution

  test "part one" do
    assert Solution.one("12") == 2
    assert Solution.one("14") == 2
    assert Solution.one("1969") == 654
    assert Solution.one("100756") == 33583
  end

  test "part two" do
    assert Solution.two("14") == 2
    assert Solution.two("1969") == 966
    assert Solution.two("100756") == 50346
  end
end
