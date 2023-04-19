defmodule Hangman.Runtime.Application do
  @super_name GameStarter

  use Application

  alias Hangman.Runtime

  def start(_type, _args) do
    supervisor_spec = [
      {DynamicSupervisor, strategy: :one_for_one, name: @super_name}
    ]

    Supervisor.start_link(supervisor_spec, strategy: :one_for_one)
  end

  def start_game do
    DynamicSupervisor.start_child(@super_name, {Runtime.Server, nil})
  end
end
