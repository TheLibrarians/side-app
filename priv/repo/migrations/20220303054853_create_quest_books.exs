defmodule Bb.Repo.Migrations.CreateQuestBooks do
  use Ecto.Migration

  def change do
    create table(:quest_books) do
      add :quest_id, references(:quests, on_delete: :nothing)
      add :book_id, references(:books, on_delete: :nothing)

      timestamps()
    end

    create index(:quest_books, [:quest_id])
    create index(:quest_books, [:book_id])
  end
end
