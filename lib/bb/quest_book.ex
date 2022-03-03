defmodule Bb.QuestBook do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quest_books" do

    field :quest_id, :id
    field :book_id, :id

    timestamps()
  end

  @doc false
  def changeset(quest_book, attrs) do
    quest_book
    |> cast(attrs, [])
    |> validate_required([])
  end
end
