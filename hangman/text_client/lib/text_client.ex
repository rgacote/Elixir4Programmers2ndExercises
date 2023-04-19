defmodule TextClient do
  @moduledoc """
  Documentation for `TextClient`.
  """
  @spec start() :: :ok
  def start() do
    TextClient.Runtime.RemoteHangman.connect()
    |> TextClient.Impl.Player.start()
  end
end
