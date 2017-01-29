defmodule Unity.Schema.Field.Node do
  @moduledoc """
  Provides a Relay-compliant Node field used for re-fetching an item by it's
  base64-encoded ID.
  """

  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation

  # alias Heart.Resolver.Organization

  object :node_field do
    node field do
      resolve fn
        # %{type: :organization, id: id}, _ ->
          # Organization.find(%{id: id}, %{})
        _, _ ->
          nil
      end
    end
  end
end
