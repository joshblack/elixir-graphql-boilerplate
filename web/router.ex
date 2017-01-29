defmodule Unity.Router do
  use Unity.Web, :router

  forward "/graphql", Absinthe.Plug, schema: Unity.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Unity.Schema
end
