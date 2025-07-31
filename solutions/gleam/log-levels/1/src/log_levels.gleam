import gleam/string
import gleam/result
import gleam/pair

pub fn message(log_line: String) -> String {
  string.split_once(log_line, " ")
  |> result.unwrap(#("", ""))
  |> pair.second
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  string.split_once(log_line, " ")
  |> result.unwrap(#("", ""))
  |> pair.first
  |> string.drop_left(1)
  |> string.drop_right(2)
  |> string.lowercase
}

pub fn reformat(log_line: String) -> String {
  message(log_line)
  <> " ("
  <> log_level(log_line)
  <> ")"
}
