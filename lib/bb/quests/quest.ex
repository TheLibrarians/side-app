defmodule Bb.Quests.Quest do
  use Ecto.Schema
  import Ecto.Changeset

  alias Bb.Books.Book

  schema "quests" do
    field :description, :string
    field :tags, {:array, :string}
    field :title, :string
    field :author_id, :id

    many_to_many :books, Book, join_through: Bb.QuestBook

    timestamps()
  end

  @doc false
  def changeset(quest, attrs) do
    quest
    |> cast(attrs, [:title, :description, :tags])
    |> validate_required([:title, :description])
  end
end
