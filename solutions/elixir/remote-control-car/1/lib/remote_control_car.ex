defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:battery_percentage, :distance_driven_in_meters, :nickname]

  def new() do
    %RemoteControlCar{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: "none"
    }
  end

  def new(nickname) do
    %RemoteControlCar{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: nickname
    }
  end

  def display_distance(remote_car) do
    if Map.get(remote_car, :__struct__) != RemoteControlCar do
      raise FunctionClauseError
    end

    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(remote_car) do
    if Map.get(remote_car, :__struct__) != RemoteControlCar do
      raise FunctionClauseError
    end

    battery_msg =
      if remote_car.battery_percentage != 0 do
        "at #{remote_car.battery_percentage}%"
      else
        "empty"
      end

    "Battery #{battery_msg}"
  end

  def drive(remote_car) do
    if Map.get(remote_car, :__struct__) != RemoteControlCar do
      raise FunctionClauseError
    end

    if remote_car.battery_percentage == 0 do
      remote_car
    else
      %{
        remote_car
        | distance_driven_in_meters: remote_car.distance_driven_in_meters + 20,
          battery_percentage: remote_car.battery_percentage - 1
      }
    end
  end
end
