defmodule Bb.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :cover, :string
    field :description, :string
    field :goodreads_url, :string
    field :title, :string
    field :author_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :cover, :description, :goodreads_url])
    |> validate_required([:title, :cover, :description, :goodreads_url])
  end
end
