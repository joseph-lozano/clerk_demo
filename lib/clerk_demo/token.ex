defmodule ClerkDemo.Token do
  # no signer
  use Joken.Config, default_signer: nil

  # This hook implements a before_verify callback that checks whether it has a signer configuration
  # cached. If it does not, it tries to fetch it from the jwks_url.
  add_hook(JokenJwks, strategy: ClerkDemo.Strategy)

  @impl true
  def token_config do
    default_claims(skip: [:aud, :iss])
    |> add_claim("iss", nil, &(&1 == "https://smart-sunbird-23.clerk.accounts.dev"))
  end
end
