defmodule Bb.Activity do
  @moduledoc """
  The Activity context.
  """

  import Ecto.Query, warn: false
  alias Bb.Repo

  alias Bb.Activity.BookStatus

  @doc """
  Returns the list of book_statuses.

  ## Examples

      iex> list_book_statuses()
      [%BookStatus{}, ...]

  """
  def list_book_statuses do
    Repo.all(BookStatus)
  end

  @doc """
  Gets a single book_status.

  Raises `Ecto.NoResultsError` if the Book status does not exist.

  ## Examples

      iex> get_book_status!(123)
      %BookStatus{}

      iex> get_book_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_status!(id), do: Repo.get!(BookStatus, id)

  @doc """
  Creates a book_status.

  ## Examples

      iex> create_book_status(%{field: value})
      {:ok, %BookStatus{}}

      iex> create_book_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_status(attrs \\ %{}) do
    %BookStatus{}
    |> BookStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book_status.

  ## Examples

      iex> update_book_status(book_status, %{field: new_value})
      {:ok, %BookStatus{}}

      iex> update_book_status(book_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_status(%BookStatus{} = book_status, attrs) do
    book_status
    |> BookStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book_status.

  ## Examples

      iex> delete_book_status(book_status)
      {:ok, %BookStatus{}}

      iex> delete_book_status(book_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_status(%BookStatus{} = book_status) do
    Repo.delete(book_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_status changes.

  ## Examples

      iex> change_book_status(book_status)
      %Ecto.Changeset{data: %BookStatus{}}

  """
  def change_book_status(%BookStatus{} = book_status, attrs \\ %{}) do
    BookStatus.changeset(book_status, attrs)
  end
end
