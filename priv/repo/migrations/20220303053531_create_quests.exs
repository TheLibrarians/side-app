defmodule Bb.Repo.Migrations.CreateQuests do
  use Ecto.Migration

  def change do
    create table(:quests) do
      add :title, :string
      add :description, :string
      add :tags, {:array, :string}
      add :author_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:quests, [:author_id])
  end
end
