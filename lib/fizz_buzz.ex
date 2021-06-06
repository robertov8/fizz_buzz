defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(element) do
    number =
      element
      |> String.trim()
      |> String.to_integer()

    evalute_numbers(number)
  end

  defp evalute_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizz_buzz
  defp evalute_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evalute_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evalute_numbers(number), do: number
end
