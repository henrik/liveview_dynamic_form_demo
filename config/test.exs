import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :form_demo, FormDemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "x4YlXtKwj+bu4CPkFxZPauzh7A0v1cCSnLfz4jnrIpQM+GyuNmwBUelyWXAnHbf1",
  server: false

# In test we don't send emails.
config :form_demo, FormDemo.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
