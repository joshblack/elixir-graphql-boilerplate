defmodule Unity.Resolver.Team do
  alias Absinthe.Relay.Connection
  alias Unity.Team
  alias Unity.Error

  use Unity.Web, :resolver
  use Unity.Relay.ConnectionHelper, repo: Unity.Repo, module: Team

  def create(args, _info) do
    changeset = Team.changeset(%Team{}, args)

    case Repo.insert(changeset) do
      {:ok, team} ->
        payload = %{
          new_team_edge: get_edge_for(team),
        }

        {:ok, payload}

      {:error, changeset} ->
        {:error, Error.format(changeset)}
    end
  end
end
