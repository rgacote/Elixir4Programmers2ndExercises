defmodule TextClient.Runtime.RemoteHangman do
  @remote_server :"hangman@rgac-ms-2022"

  def connect() do
    :rpc.call(@remote_server, Hangman, :new_game, [])
  end
end
