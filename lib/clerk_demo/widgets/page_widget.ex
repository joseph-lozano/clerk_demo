defmodule ClerkDemo.Widgets.PageWidget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "page_widgets" do
    field :name, :string
    field :user_id, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page_widget, attrs) do
    page_widget
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
