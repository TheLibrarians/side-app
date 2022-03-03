defmodule Bb.Activity.BookStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_statuses" do
    field :status, :string
    field :user_id, :id
    field :book_id, :id

    timestamps()
  end

  @doc false
  def changeset(book_status, attrs) do
    book_status
    |> cast(attrs, [:status])
    |> validate_required([:status])
  end
end
