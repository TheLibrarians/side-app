defmodule Bb.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :cover, :string
      add :description, :string
      add :goodreads_url, :string
      add :author_id, references(:authors, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:books, [:author_id])
    create index(:books, [:user_id])
  end
end
