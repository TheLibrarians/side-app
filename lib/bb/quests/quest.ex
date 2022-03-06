defmodule Bb.Quests.Quest do
  use Ecto.Schema
  import Ecto.Changeset

  alias Bb.Books.Book

  schema "quests" do
    field :description, :string
    field :tags, {:array, :string}
    field :title, :string
    field :author_id, :id

    many_to_many :books, Book, join_through: Bb.QuestBook, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(quest, attrs) do
    quest
    |> cast(attrs, [:title, :description, :tags])
    |> validate_required([:title, :description])
  end

  @doc """
  We don't do any validation of books..

  here, books is a map

  Also, we're just doing the dangerous version of on_replace: :delete...
  """
  def changeset(quest, attrs, books) do
    quest
    |> cast(attrs, [:title, :description, :tags])
    |> validate_required([:title, :description])
    |> put_assoc(:books, Map.values(books))
  end
end
