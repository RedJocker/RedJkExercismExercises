defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_ | tail]) do
    tail
  end

  def first([head | _]) do
    head
  end

  def count([]) do
    0
  end

  def count([_ | tail]) do
    1 + count(tail)
  end

  def functional_list?([]) do
    false
  end

  def functional_list?(["Elixir" | _]) do
    true
  end

  def functional_list?([_ | tail]) do
    functional_list?(tail)
  end
end
