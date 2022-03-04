defmodule Bb.Repo.Migrations.CitextBookTitles do
  use Ecto.Migration

  def up do
    alter table(:books) do
      modify :title, :citext, null: false
    end
  end

  def down do
    alter table(:books) do
      modify :title, :string
    end
  end
end
