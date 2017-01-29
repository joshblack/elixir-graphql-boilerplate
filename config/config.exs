# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :unity,
  ecto_repos: [Unity.Repo]

# Configures the endpoint
config :unity, Unity.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "w75J23/qzDLZ9Xch7mQwjn7xQovmkJ2mSLSgbXNAp3SuorzNsgvZQDa6zxf1Z0X0",
  render_errors: [view: Unity.ErrorView, accepts: ~w(json)],
  pubsub: [name: Unity.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  binary_id: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
