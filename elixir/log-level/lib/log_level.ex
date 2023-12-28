defmodule LogLevel do
  def to_label(level, legacy?) do
    # cond do
    #   level == 0 -> (legacy? && :unknown) || :trace
    #   level == 1 -> :debug
    #   level == 2 -> :info
    #   level == 3 -> :warning
    #   level == 4 -> :error
    #   level == 5 -> (legacy? && :unknown) || :fatal
    #   true -> :unknown
    # end
    case level do
      0 -> (legacy? && :unknown) || :trace
      1 -> :debug
      2 -> :info
      3 -> :warning
      4 -> :error
      5 -> (legacy? && :unknown) || :fatal
      _ -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    # cond do
    #   label == :error -> :ops
    #   label == :fatal -> :ops
    #   label == :unknown && legacy? -> :dev1
    #   label == :unknown -> :dev2
    #   true -> false
    # end
    case label do
      :error -> :ops
      :fatal -> :ops
      :unknown -> (legacy? && :dev1) || :dev2
      _ -> false
    end
  end
end
