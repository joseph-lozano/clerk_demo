defmodule ClerkDemo.Widgets.PageWidget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "page_widgets" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page_widget, attrs) do
    page_widget
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
