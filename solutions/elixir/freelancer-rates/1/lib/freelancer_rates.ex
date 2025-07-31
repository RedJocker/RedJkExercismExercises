defmodule FreelancerRates do

  @billable_days 22
  
  @spec daily_rate(Interger) :: Float 
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  @spec apply_discount(Float, Float) :: Float
  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * discount / 100)
  end

  @spec monthly_rate(Integer, Float) :: Integer
  def monthly_rate(hourly_rate, discount) do
    total_without_discount = @billable_days * daily_rate(hourly_rate)
    
    apply_discount(total_without_discount, discount)
    |> Float.ceil()
    |> Kernel.trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    monthly_cost = monthly_rate(hourly_rate, discount)
    daily_cost = apply_discount(daily_rate(hourly_rate), discount)
    months = div(budget, monthly_cost)
    remaining_budget = budget - (months * monthly_cost)
    days = Float.floor(remaining_budget / daily_cost, 1)
    
    (months * @billable_days) + days
  end
end
