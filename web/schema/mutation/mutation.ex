defmodule Unity.Schema.Mutation do
  @moduledoc """
  Provides access to all the Fields that we've defined for our Root Query Type.
  """

  use Absinthe.Schema.Notation

  import_types Unity.Schema.Mutation.Team
end

