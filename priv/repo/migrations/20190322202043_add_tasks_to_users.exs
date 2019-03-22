defmodule Tasks.Repo.Migrations.AddTasksToUsers do
  use Ecto.Migration

  def change do
      alter table(:events) do
        add :user_id, references(:users, on_delete: :delete_all), null: false
      end
  end
end
