defmodule TakeANumber do

  def message_handler(state \\ 0) do
    receive do
      {:report_state, sender_pid } ->
	send(sender_pid, state)
	message_handler(state)
      {:take_a_number, sender_pid} ->
	new_state = state + 1
	send(sender_pid, new_state)
	message_handler(new_state)
      :stop -> nil
      _ -> message_handler(state)
    end
  end
  
  def start() do
    pid = spawn(&message_handler/0)
    
    pid
  end
end
