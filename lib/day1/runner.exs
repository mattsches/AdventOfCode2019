input =
  "../input.txt"
  |> Path.expand(__ENV__.file)
  |> File.read!()

IO.puts(Day1.Solution.one(input))
IO.puts(Day1.Solution.two(input))