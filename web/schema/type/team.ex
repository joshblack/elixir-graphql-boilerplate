defmodule Unity.Schema.Type.Team do
  @moduledoc """
  Provides a Team Type for use in a GraphQL Schema.
  """
  use Unity.Web, :type

  node object :team do
    @desc "The name of the team."
    field :name, non_null(:string)

    @desc "The description for the team."
    field :description, non_null(:string)

    @desc "The slug for the team."
    field :slug, non_null(:string)

    @desc "The location of the team."
    field :location, :string

    @desc "The time the team was inserted at."
    field :inserted_at, non_null(:string)

    @desc "The time the team was last updated."
    field :updated_at, non_null(:string)
  end

  connection node_type: :team do
    field :total_count, :integer

    edge do
    end
  end
end
