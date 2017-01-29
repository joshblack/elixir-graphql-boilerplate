defmodule Unity.Schema.Type do
  @moduledoc """
  Provides access to all the types that we've defined in our Schema for use in
  Queries, Mutations, and Subscriptions.
  """

  use Unity.Web, :type

  import_types Unity.Schema.Type.Node
  import_types Unity.Schema.Type.Viewer
end
