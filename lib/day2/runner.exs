input =
  "../input.txt"
  |> Path.expand(__ENV__.file)
  |> File.read!()

IO.puts(Day2.Solution.one(input, 12, 2))
IO.puts(Day2.Solution.two(input))