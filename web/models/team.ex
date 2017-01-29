defmodule Unity.Team do
  @moduledoc """
  """

  use Unity.Web, :model

  schema "teams" do
    field :name, :string
    field :description, :string
    field :location, :string
    field :slug, :string

    timestamps()
  end

  @required_fields ~w(name, description, slug, location)

  @doc """
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :location], [:slug])
    |> slugify(:name)
    |> validate_required(@required_fields)
    |> unique_constraint(:name)
    |> unique_constraint(:slug)
  end
end
