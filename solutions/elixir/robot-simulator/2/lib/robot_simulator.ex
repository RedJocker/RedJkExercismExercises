defmodule RobotSimulator do
  @type robot() :: any()
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0}) do
	cond do
	  (direction not in [:north, :east, :south, :west]) ->
		{:error, "invalid direction"}
	  not is_tuple(position)
	  || tuple_size(position) != 2
	  || not is_number(elem(position, 0))
	  || not is_number(elem(position, 1)) ->
		{:error, "invalid position"}
	  true ->
		%{direction: direction, position: position}
	end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, "R" <> tail) do
	new_direction = case robot.direction do
	  :north -> :east
	  :east -> :south
	  :south -> :west
	  :west -> :north
	end
	simulate(%{ robot | direction: new_direction }, tail)  
  end

  def simulate(robot, "L" <> tail) do
	new_direction = case robot.direction do
	  :north -> :west
	  :east -> :north
	  :south -> :east
	  :west -> :south
	end
	simulate(%{ robot | direction: new_direction }, tail)  
  end

  def simulate(%{direction: direction, position: {x, y}} = robot, "A" <> tail) do
	new_position = case direction do
	  :north -> {x, y + 1}
	  :east -> {x + 1, y}
	  :south -> {x, y - 1}
	  :west -> {x - 1, y}
	end
	simulate(%{  robot | position: new_position }, tail)		
  end

  def simulate(robot, "") do
	robot
  end

  def simulate(_robot, _instruction) do
	{:error, "invalid instruction"}
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot) :: direction()
  def direction(robot) do
	robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position(robot) do
	robot.position
  end
end
