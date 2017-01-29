defmodule Unity.Router do
  use Unity.Web, :router

  forward "/graphql", Absinthe.Plug, schema: Unity.Schema

  if Mix.env == "dev" do
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Unity.Schema
  end
end
