defmodule Unity.Schema.Mutation.Team do
  @module """
  """

  alias Unity.Resolver.Team

  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation

  object :team_mutations do
    payload field :create_team do
      input do
        # import_fields :team
        field :name, non_null(:string)
        field :description, non_null(:string)
        field :location, :string
      end

      output do
        field :new_team_edge, :team_edge
      end
    end
  end
end
