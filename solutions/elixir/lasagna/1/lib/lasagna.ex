defmodule Lasagna do
  
  @doc """
  Returns how many minutes the lasagna should be in the oven.
  """
  def expected_minutes_in_oven(), do: 40


  @doc """
  Takes the actual minutes the lasagna has been in the oven as 
  a argument and returns how many minutes the lasagna still has 
  to remain in the oven
  """
  def remaining_minutes_in_oven(actual_minutes) do
    expected_minutes_in_oven() - actual_minutes
  end


  @doc """
  Takes the number of layers you added to the lasagna as a argument
  and returns how many minutes you spent preparing the lasagna
  """
  def preparation_time_in_minutes(number_of_layers) do
    number_of_layers * 2
  end


  @doc """
  Takes two arguments: the first argument is the number of layers you added 
  to the lasagna, and the second argument is the number of minutes the lasagna 
  has been in the oven. 
  Returns how many minutes in total you've worked on cooking the lasagna, 
  which is the sum of the preparation time in minutes, and the time in minutes 
  the lasagna has spent in the oven at the moment.
  """
  def total_time_in_minutes(number_of_layers, minutes_in_oven) do
    preparation_time_in_minutes(number_of_layers) + minutes_in_oven
  end


  @doc """
  Returns a message indicating that the lasagna is ready to eat.
  """
  def alarm() do
    "Ding!"
  end

end
