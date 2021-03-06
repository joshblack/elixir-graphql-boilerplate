defmodule Unity.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use Unity.Web, :controller
      use Unity.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id

      defp slugify(changeset, field) do
        if value = get_change(changeset, field) do
          put_change(changeset, :slug, Slugger.slugify_downcase(value))
        else
          changeset
        end
      end
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      alias Unity.Repo
      import Ecto
      import Ecto.Query

      import Unity.Router.Helpers
      import Unity.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      import Unity.Router.Helpers
      import Unity.ErrorHelpers
      import Unity.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias Unity.Repo
      import Ecto
      import Ecto.Query
      import Unity.Gettext
    end
  end

  def type do
    quote do
      # Provides us with a DSL for defining GraphQL Types
      use Absinthe.Schema.Notation
      use Absinthe.Relay.Schema.Notation

      # Enable helpers for batching associated requests
      use Absinthe.Ecto, repo: Unity.Repo
    end
  end

  def resolver do
    quote do
      alias Unity.Repo
      import Ecto
      import Ecto.Query
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
