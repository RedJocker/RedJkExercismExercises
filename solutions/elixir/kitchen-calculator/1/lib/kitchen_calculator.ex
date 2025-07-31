defmodule KitchenCalculator do
  def get_volume({_unit, volume}) do
    volume
  end

  def to_milliliter({unit, volume}) do
    new_volume =
      case unit do
        :cup -> 240 * volume
        :fluid_ounce -> 30 * volume
        :teaspoon -> 5 * volume
        :tablespoon -> 15 * volume
        :milliliter -> volume
      end

    {:milliliter, new_volume}
  end

  def from_milliliter({:milliliter, volume}, unit) do
    new_volume =
      case unit do
        :cup -> volume / 240
        :fluid_ounce -> volume / 30
        :teaspoon -> volume / 5
        :tablespoon -> volume / 15
        :milliliter -> volume
      end

    {unit, new_volume}
  end

  def convert(volume_pair, unit) do
    millis_pair = to_milliliter(volume_pair)
    from_milliliter(millis_pair, unit)
  end
end
