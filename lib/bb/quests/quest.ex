defmodule Bb.Quests.Quest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quests" do
    field :description, :string
    field :tags, {:array, :string}
    field :title, :string
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(quest, attrs) do
    quest
    |> cast(attrs, [:title, :description, :tags])
    |> validate_required([:title, :description, :tags])
  end
end
