defmodule Unity.Resolver.Team do
  alias Unity.Team
  alias Absinthe.Relay.Connection

  use Unity.Web, :resolver
  use Unity.Relay.ConnectionHelper, repo: Unity.Repo, module: Team

  def create(args, _info) do
    changeset = Team.changeset(%Team{}, args)

    case Repo.insert(changeset) do
      {:ok, team} ->
        {
          :ok,
          %{
            viewer: %{},
            new_team_edge: get_edge_for(team)
          }
        }
    end
  end
end
