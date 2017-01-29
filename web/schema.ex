defmodule Unity.Schema do
  @moduledoc """
  The GraphQL Schema for Heart that imports all the Types, Fields, and Mutations
  and imports the specific fields from each for our Root Query Type and Root
  Mutation Type.
  """

  use Absinthe.Schema
  use Absinthe.Relay.Schema

  import_types Unity.Schema.Type
  import_types Unity.Schema.Field

  query do
    import_fields :node_field
    import_fields :viewer_field
  end
end
