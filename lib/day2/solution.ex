defmodule Day2.Solution do
  @typedoc """
  The program, a map consisting of opcodes
  """
  @type program() :: Map.t()

  @doc """
  Part one
  """
  @spec one(String.t(), Integer.t(), Integer.t()) :: String.t()
  def one(input, noun, verb) do
    input
    |> normalize(noun, verb)
    |> handle(0)
    |> print_result()
    |> Map.values()
    |> Enum.join(",")
  end

  @doc """
  Part two. More or less copied from https://github.com/mhanberg/advent-of-code/blob/master/2019/elixir/lib/advent_of_code_2019/day_02.ex
  I learned a lot :)
  """
  @spec two(String.t()) :: Integer.t()
  def two(input) do
    {_, noun, verb} =
      for noun <- 0..99, verb <- 0..99 do
        Task.async(
          fn ->
            output =
              input
              |> normalize(noun, verb)
              |> handle(0)
              |> Map.get(0)
            {output, noun, verb}
          end
        )
      end
      |> Enum.map(&Task.await/1)
      |> Enum.find(fn {output, _noun, _verb} -> output == 19_690_720 end)

    100 * noun + verb
  end

  @spec handle(program(), Integer.t()) :: program()
  defp handle(program, pos) do
    case program[pos] do
      1 ->
        calc_output(program, pos, "+")
        |> handle(pos + 4)

      2 ->
        calc_output(program, pos, "*")
        |> handle(pos + 4)

      99 ->
        program
    end
  end

  @spec calc_output(program(), Integer.t(), String.t()) :: nil
  defp calc_output(program, pos, operator) when operator == "+" do
    Map.put(program, program[pos + 3], program[program[pos + 1]] + program[program[pos + 2]])
  end
  defp calc_output(program, pos, operator) when operator == "*" do
    Map.put(program, program[pos + 3], program[program[pos + 1]] * program[program[pos + 2]])
  end

  @spec normalize(String.t(), Integer.t(), Integer.t()) :: program()
  defp normalize(input, noun, verb) do
    input
    |> String.split(",", trim: true)
    |> Enum.map(
         fn x ->
           String.to_integer(x)
         end
       )
    |> Enum.with_index()
    |> Enum.reduce(
         Map.new(),
         fn {opcode, i}, map ->
           Map.put(map, i, opcode)
         end
       )
    |> Map.put(1, noun)
    |> Map.put(2, verb)
  end

  @spec print_result(program()) :: program()
  defp print_result(program) do
    IO.inspect(program[0])
    program
  end
end
