defmodule ClerkDemo.Repo do
  use Ecto.Repo,
    otp_app: :clerk_demo,
    adapter: Ecto.Adapters.Postgres
end
