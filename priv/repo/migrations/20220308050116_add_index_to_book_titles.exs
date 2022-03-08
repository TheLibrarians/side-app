defmodule Bb.Repo.Migrations.AddIndexToBookTitles do
  use Ecto.Migration

  def change do
    create index(:books, [:title])
  end
end
