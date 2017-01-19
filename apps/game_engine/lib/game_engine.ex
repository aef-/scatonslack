defmodule ScatOnSlack.GameEngine do
  use Application
  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    start_session_supervisor
  end

  defp start_session_supervisor do
    session_worker = worker(ScatOnSlack.GameEngine.Host, [])
    Supervisor.start_link([session_worker], strategy: :simple_one_for_one, name: ScatOnSlack.SessionSupervisor)
  end

  defp start_session(key: key) when is_binary(key), do: raise "Please use an atom key"
  defp start_session(key: key) when is_atom(key) do
    res = Supervisor.start_child(ScatOnSlack.SessionSupervisor, %{key: key})
  end
end
