defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    numeralp(number)
  end

  defp numeralp(number, acc \\ "")

  defp numeralp(number, acc) when number <= 0 do
    acc
  end

  defp numeralp(number, acc) when number >= 1000 do
    numeralp(number - 1000, acc <> "M")
  end

  defp numeralp(number, acc) when number >= 900 do
    numeralp(number - 900, acc <> "CM")
  end

  defp numeralp(number, acc) when number >= 500 do
    numeralp(number - 500, acc <> "D")
  end

  defp numeralp(number, acc) when number >= 400 do
    numeralp(number - 400, acc <> "CD")
  end

  defp numeralp(number, acc) when number >= 100 do
    numeralp(number - 100, acc <> "C")
  end

  defp numeralp(number, acc) when number >= 90 do
    numeralp(number - 90, acc <> "XC")
  end

  defp numeralp(number, acc) when number >= 50 do
    numeralp(number - 50, acc <> "L")
  end

  defp numeralp(number, acc) when number >= 40 do
    numeralp(number - 40, acc <> "XL")
  end

  defp numeralp(number, acc) when number >= 10 do
    numeralp(number - 10, acc <> "X")
  end

  defp numeralp(number, acc) when number >= 9 do
    numeralp(number - 9, acc <> "IX")
  end

  defp numeralp(number, acc) when number >= 5 do
    numeralp(number - 5, acc <> "V")
  end

  defp numeralp(number, acc) when number >= 4 do
    numeralp(number - 4, acc <> "IV")
  end

  defp numeralp(number, acc) when number >= 1 do
    numeralp(number - 1, acc <> "I")
  end
end
