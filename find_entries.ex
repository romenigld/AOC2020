defmodule FindEntries do
  def find(numbers) do
    numbers
    |> read_file()
    |> String.trim()
    |> String.split("\n")
    |>  Enum.map(&String.to_integer/1)
    #|> IO.inspect(label: "Enum.map(&String.to_integer/1 \n")
    |> match_2020()

  end

  def read_file(path) do
    case File.read(path) do
      {:ok, body} ->
          body
      {:error, reason} ->
          reason
    end
  end

  def match_2020(list) do
    [{a, b} | _list] =
            for i <- list, j <- list,
                  i + j == 2020,
                  do: {i, j}

    IO.puts "The sum of two numbers of the list which is equal to 2020 is: \{ #{a}, #{b} \}."
    IO.puts "The multiplication: (#{a} x #{b}) = #{a * b}"

    [{a, b, c} | _] =
            for i <- list, j <- list, k <- list,
              i + j + k == 2020,
              do: {i, j, k}

    IO.puts "The sum of three numbers of the list which is equal to 2020 is: [#{a}, #{b}, #{c}]."
    IO.puts "The multiplication: (#{a} x #{b} x #{c}) = #{a * b * c}"
  end
end

FindEntries.find "./puzzle_input.txt"
