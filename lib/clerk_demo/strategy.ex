defmodule ClerkDemo.Strategy do
  use JokenJwks.DefaultStrategyTemplate

  def init_opts(opts) do
    url = "https://smart-sunbird-23.clerk.accounts.dev/.well-known/jwks.json"
    Keyword.merge(opts, jwks_url: url)
  end
end
