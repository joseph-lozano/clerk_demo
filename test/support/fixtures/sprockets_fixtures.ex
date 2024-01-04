defmodule ClerkDemo.SprocketsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClerkDemo.Sprockets` context.
  """

  @doc """
  Generate a live_sprocket.
  """
  def live_sprocket_fixture(attrs \\ %{}) do
    {:ok, live_sprocket} =
      attrs
      |> Enum.into(%{
        name: "some name",
        user_id: "some user_id"
      })
      |> ClerkDemo.Sprockets.create_live_sprocket()

    live_sprocket
  end
end
