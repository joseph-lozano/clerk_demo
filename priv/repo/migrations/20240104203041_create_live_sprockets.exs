defmodule ClerkDemo.Repo.Migrations.CreateLiveSprockets do
  use Ecto.Migration

  def change do
    create table(:live_sprockets) do
      add :name, :string
      add :user_id, :string

      timestamps(type: :utc_datetime)
    end
  end
end
