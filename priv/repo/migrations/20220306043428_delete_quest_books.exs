defmodule Bb.Repo.Migrations.DeleteQuestBooks do
  use Ecto.Migration

  def change do
    alter table(:quest_books) do
      modify :quest_id, references(:quests, on_delete: :delete_all),
        from: references(:quests, on_delete: :nothing)

      modify :book_id, references(:books, on_delete: :delete_all),
        from: references(:books, on_delete: :nothing)
    end
  end
end
