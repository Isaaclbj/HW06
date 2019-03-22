defmodule Tasks.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :desc, :string
      add :time, :integer
      add :done, :boolean, default: false, null: false

      timestamps()
    end

  end
end
