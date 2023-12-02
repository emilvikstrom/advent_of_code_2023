defmodule Day1 do
  def sum_input(filename) do
    File.stream!(filename)
    |> Enum.map(&get_integers/1)
    |> Enum.reduce(0, fn number, acc ->
      number + acc
    end)
  end

  defp get_integers(string) do
    list =
      String.split(string, "")
      |> Enum.reduce([], fn string, acc ->
        case check_is_integer(string) do
          :error -> acc
          int -> [int | acc]
        end
      end)

    [last | _] = list

    [first | _] = Enum.reverse(list)

    first * 10 + last
  end

  defp check_is_integer(char) do
    Integer.parse(char)
    |> case do
      {int, ""} ->
        int

      :error ->
        :error
    end
  end
end
