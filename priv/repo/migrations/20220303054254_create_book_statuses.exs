defmodule Bb.Repo.Migrations.CreateBookStatuses do
  use Ecto.Migration

  def change do
    create table(:book_statuses) do
      add :status, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :book_id, references(:books, on_delete: :nothing)

      timestamps()
    end

    create index(:book_statuses, [:user_id])
    create index(:book_statuses, [:book_id])
  end
end
