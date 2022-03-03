defmodule Bb.Repo.Migrations.CreateQuestStatuses do
  use Ecto.Migration

  def change do
    create table(:quest_statuses) do
      add :completed, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :quest_id, references(:quests, on_delete: :nothing)

      timestamps()
    end

    create index(:quest_statuses, [:user_id])
    create index(:quest_statuses, [:quest_id])
  end
end
