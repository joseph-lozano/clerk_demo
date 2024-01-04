defmodule ClerkDemo.Repo.Migrations.CreatePageWidgets do
  use Ecto.Migration

  def change do
    create table(:page_widgets) do
      add :name, :string
      add :user_id, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
