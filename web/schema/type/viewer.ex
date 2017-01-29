defmodule Unity.Schema.Type.Viewer do
  @moduledoc """
  Provides a Root Viewer Type for use in a GraphQL Schema. This is helpful when
  working with Relay-specific clients since fragments will be based off of this
  Viewer Type.
  """
  # alias Unity.Resolver.Team

  use Unity.Web, :type

  object :viewer do
    connection field :teams, node_type: :team do
      resolve &Team.all/2
    end
  end
end
