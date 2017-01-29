defmodule Unity.CreateTeamTest do
  use Unity.ConnCase

  test "#createTeam creates a new team" do
    conn = build_conn()

    query = """
    mutation M($input: CreateTeamInput!) {
      createTeam(input: $input) {
        newTeamEdge {
          node {
            name
            description
            slug
          }
        }
      }
    }
    """

    variables = %{
      input: %{
        clientMutationId: "a",
        name: "New Team",
        description: "A new team.",
      },
    }

    conn = post conn, "/graphql", %{query: query, variables: variables}

    assert json_response(conn, 200) == %{
      "data" => %{
        "createTeam" => %{
          "newTeamEdge" => %{
            "node" => %{
              "name" => variables.input.name,
              "description" => variables.input.description,
              "slug" => Slugger.slugify_downcase(variables.input.name),
            },
          },
        },
      },
    }
  end

  test "#createTeam reports when a unique constraint is violated" do
    conn = build_conn()

    query = """
    mutation M($input: CreateTeamInput!) {
      createTeam(input: $input) {
        newTeamEdge {
          node {
            name
            description
            slug
          }
        }
      }
    }
    """

    variables = %{
      input: %{
        clientMutationId: "a",
        name: "New Team",
        description: "A new team.",
      },
    }

    conn = post conn, "/graphql", %{query: query, variables: variables}
    conn = post conn, "/graphql", %{query: query, variables: variables}

    response = json_response(conn, 200)

    assert response["data"] == %{}
    assert length(response["errors"]) == 1
    assert List.first(response["errors"])["message"] ==
      "In field \"createTeam\": Invalid Attribute for field `name`"
  end
end
