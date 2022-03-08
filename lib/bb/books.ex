defmodule Bb.Books do
  @moduledoc """
  The Books context.
  """

  import Ecto.Query, warn: false
  alias Bb.Repo

  alias Bb.Books.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books(limit \\ 15) do
    Repo.all(from b in Book, limit: ^limit)
  end

  def search(title, limit \\ 15) do
    user_query = "%#{title}%"
    Repo.all(from b in Book, where: like(b.title, ^user_query), limit: ^limit)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Upserts a book
  """
  def upsert_book(%Book{} = book, attrs) do
    book |> Book.changeset(attrs) |> Repo.insert!(on_conflict: :nothing)
  end

  @doc """
  Upserts multiple books
  """
  def upsert_books(books) do
    timestamp =
      NaiveDateTime.utc_now()
      |> NaiveDateTime.truncate(:second)

    placeholders = %{timestamp: timestamp}

    names = Enum.map(books, & &1.title)

    maps =
      Enum.map(
        books,
        &%{
          title: &1.title,
          description: &1.description,
          goodreads_url: &1.goodreads_url,
          cover: &1.cover,
          inserted_at: {:placeholder, :timestamp},
          updated_at: {:placeholder, :timestamp}
        }
      )

    Repo.insert_all(
      Book,
      maps,
      placeholders: placeholders,
      on_conflict: :nothing
    )

    Repo.all(from b in Book, where: b.title in ^names)
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end
end
