defmodule Username do
  @lowers [?_ | Enum.to_list(?a..?z)]

  def sanitize(username) do
    sanitize_helper(username)
  end

  defp sanitize_helper([]) do
    []
  end

  defp sanitize_helper([ch | chs]) do
    case ch do
      ch when ch in @lowers ->
        [ch | sanitize_helper(chs)]

      ?ö ->
        [?o | [?e | sanitize_helper(chs)]]

      ?ü ->
        [?u | [?e | sanitize_helper(chs)]]

      ?ä ->
        [?a | [?e | sanitize_helper(chs)]]

      ?ß ->
        [?s | [?s | sanitize_helper(chs)]]

      _ ->
        sanitize_helper(chs)
    end
  end
end
