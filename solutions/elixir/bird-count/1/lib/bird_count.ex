defmodule BirdCount do
  def today([]) do
    nil
  end

  def today([today_count | _]) do
    today_count
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count([today_count | rest_count_lst]) do
    [today_count + 1 | rest_count_lst]
  end

  def has_day_without_birds?(list) do
    0 in list
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days(list) do
    list
    |> Enum.filter(fn day_count -> day_count >= 5 end)
    |> Enum.count()
  end
end
