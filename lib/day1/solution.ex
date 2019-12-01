defmodule Day1.Solution do

  @spec one(input: String.t) :: integer
  def one(input) do
    input
    |> normalize()
    |> Enum.map(&(fuel_for(&1)))
    |> Enum.sum()
  end

  @spec two(input: String.t) :: integer
  def two(input) do
    input
    |> normalize()
    |> Enum.map(&(fuel_recursive(&1)))
    |> Enum.sum()
  end

  @spec fuel_for(mass: integer) :: integer
  defp fuel_for(mass) do
    mass
    |> div(3)
    |> floor()
    |> Kernel.-(2)
  end

  @spec fuel_recursive(mass: integer) :: integer
  defp fuel_recursive(mass) when floor(div(mass, 3)) - 2 <= 0, do: 0
  defp fuel_recursive(mass) do
    fuel = fuel_for(mass)
    fuel + fuel_recursive(fuel)
  end

  @spec normalize(input: String.t()) :: Enumerable
  defp normalize(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(
         fn x ->
           String.to_integer(x)
         end
       )
  end
end
