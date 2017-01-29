defmodule Unity.Repo.Migrations.AddTeamsTable do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :description, :string
      add :slug, :string, null: false
      add :location, :string

      timestamps()
    end

    create unique_index(:teams, [:name, :slug])
  end
end
