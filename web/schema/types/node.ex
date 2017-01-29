defmodule Unity.Schema.Type.Node do
  @moduledoc """
  Provides a Node Type for use in a GraphQL Schema. This is required by any
  Relay-compliant server as Relay needs to refetch items by a base64-encoded
  id.
  """

  use Unity.Web, :type

  node interface do
    resolve_type fn
      # %Heart.Metric{}, _ -> :metric
      _, _ -> nil
    end
  end
end
