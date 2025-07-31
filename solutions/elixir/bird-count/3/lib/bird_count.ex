defmodule BirdCount do
  def today([]), do: nil

  def today([today_count | _]), do: today_count

  def increment_day_count([]), do: [1]

  def increment_day_count([today_count | rest_count_lst]) do
    [today_count + 1 | rest_count_lst]
  end

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([day_count | rest_count_lst]) do
    day_count == 0 || has_day_without_birds?(rest_count_lst)
  end

  def total(list), do: total(list, 0)

  defp total([], sum), do: sum

  defp total([day_count | rest_count_lst], sum) do
    total(rest_count_lst, sum + day_count)
  end

  def busy_days(list), do: busy_days(list, 0)

  defp busy_days([], count), do: count

  defp busy_days([day_count | rest_count_lst], count) when day_count >= 5 do
    busy_days(rest_count_lst, count + 1)
  end

  defp busy_days([_ | rest_count_lst], count) do
    busy_days(rest_count_lst, count)
  end
end
