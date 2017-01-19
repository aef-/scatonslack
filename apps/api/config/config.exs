# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api,
  namespace: ScatOnSlack.API

# Configures the endpoint
config :api, ScatOnSlack.API.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Jccl5T2iy0FJQQ5jiKdImrcl3983igwBVgNkW5ZPyX02MXNQEKGbu8twOeo8uCHU",
  render_errors: [view: ScatOnSlack.API.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ScatOnSlack.API.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
