defmodule ScatOnSlack.GameEngine.Host do

  use GenServer

  def start_link(%{key: key} = args) do
    GenServer.start_link(__MODULE__, args, name: key)
  end

  defstruct [
    team: nil,
    players: [],
    id: nil,
    topics_played: []
  ]

end
