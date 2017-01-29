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

  @required_fields ~w(name description slug location)

  @doc """
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> slugify(:name)
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end
end
