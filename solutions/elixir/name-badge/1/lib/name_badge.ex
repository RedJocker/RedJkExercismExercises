defmodule NameBadge do
  def print(id, name, department) do
    id_n = if id, do: "[#{id}] - ", else: ""

    dep_n =
      if department,
        do: "#{String.upcase(department)}",
        else: "OWNER"

    "#{id_n}#{name} - #{dep_n}"
  end
end
