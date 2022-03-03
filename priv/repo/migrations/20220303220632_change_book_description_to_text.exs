defmodule Bb.Repo.Migrations.ChangeBookDescriptionToText do
  use Ecto.Migration

  def change do
    alter table :books do
      modify :description, :text
    end
  end
end
