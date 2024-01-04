defmodule ClerkDemo.Sprockets.LiveSprocket do
  use Ecto.Schema
  import Ecto.Changeset

  schema "live_sprockets" do
    field :name, :string
    field :user_id, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(live_sprocket, attrs) do
    live_sprocket
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
