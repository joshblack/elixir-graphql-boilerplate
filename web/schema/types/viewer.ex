defmodule Unity.Schema.Type.Viewer do
  @moduledoc """
  Provides a Root Viewer Type for use in a GraphQL Schema. This is helpful when
  working with Relay-specific clients since fragments will be based off of this
  Viewer Type.
  """

  use Unity.Web, :type

  object :viewer do
    field :me, non_null(:string)
  end
end
