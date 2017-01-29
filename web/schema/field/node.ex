defmodule Unity.Schema.Field.Node do
  @moduledoc """
  Provides a Relay-compliant Node field used for re-fetching an item by it's
  base64-encoded ID.
  """

  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation

  alias Unity.Resolver.Team

  object :node_field do
    node field do
      resolve fn
        %{type: :team, id: id}, _ ->
          Team.find(%{id: id}, %{})
        _, _ ->
          nil
      end
    end
  end
end
