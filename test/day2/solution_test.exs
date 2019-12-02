defmodule Day2.SolutionTest do
  use ExUnit.Case
  alias Day2.Solution

  test "part one" do
    assert Solution.one("1,9,10,3,2,3,11,0,99,30,40,50", 9, 10) == "3500,9,10,70,2,3,11,0,99,30,40,50"
    assert Solution.one("1,0,0,0,99", 0, 0) == "2,0,0,0,99"
    assert Solution.one("2,3,0,3,99", 3, 0) == "2,3,0,6,99"
    assert Solution.one("2,4,4,5,99,0", 4, 4) == "2,4,4,5,99,9801"
    assert Solution.one("1,1,1,4,99,5,6,0,99", 1, 1) == "30,1,1,4,2,5,6,0,99"
  end

#  test "part two" do
#    assert Solution.two("14") == 2
#    assert Solution.two("1969") == 966
#    assert Solution.two("100756") == 50346
#  end
end
