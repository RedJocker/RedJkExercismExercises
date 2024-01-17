defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @number_categories [:ones, :twos, :threes, :fours, :fives, :sixes]

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dice :: [integer]) :: integer
  def score(category, dice)

  def score(category, dice) when category in @number_categories do
    cat_num = Enum.find_index(@number_categories, &(&1 == category)) + 1

    Enum.filter(dice, &(&1 == cat_num))
    |> Enum.sum()
  end

  def score(:yacht, [x, x, x, x, x]) do
    50
  end

  def score(:yacht, _dice) do
    0
  end

  def score(:full_house, dice) do
    case Enum.uniq(dice) do
      [x, y] ->
        cond do
          Enum.count(dice, &(&1 == x)) == 3 &&
              Enum.count(dice, &(&1 == y)) == 2 ->
            3 * x + 2 * y

          Enum.count(dice, &(&1 == x)) == 2 &&
              Enum.count(dice, &(&1 == y)) == 3 ->
            2 * x + 3 * y

          true ->
            0
        end

      _ ->
        0
    end
  end

  def score(:four_of_a_kind, dice) do
    case Enum.uniq(dice) do
      [x] ->
        4 * x

      [x, y] ->
        cond do
          Enum.count(dice, &(&1 == x)) == 4 -> 4 * x
          Enum.count(dice, &(&1 == y)) == 4 -> 4 * y
          true -> 0
        end

      _ ->
        0
    end
  end

  def score(:little_straight, dice) do
    case Enum.sort(dice) do
      [1, 2, 3, 4, 5] -> 30
      _ -> 0
    end
  end

  def score(:big_straight, dice) do
    case Enum.sort(dice) do
      [2, 3, 4, 5, 6] -> 30
      _ -> 0
    end
  end

  def score(:choice, dice) do
    Enum.sum(dice)
  end
end
