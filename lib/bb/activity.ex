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

  alias Bb.Activity.QuestStatus

  @doc """
  Returns the list of quest_statuses.

  ## Examples

      iex> list_quest_statuses()
      [%QuestStatus{}, ...]

  """
  def list_quest_statuses do
    Repo.all(QuestStatus)
  end

  @doc """
  Gets a single quest_status.

  Raises `Ecto.NoResultsError` if the Quest status does not exist.

  ## Examples

      iex> get_quest_status!(123)
      %QuestStatus{}

      iex> get_quest_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quest_status!(id), do: Repo.get!(QuestStatus, id)

  @doc """
  Creates a quest_status.

  ## Examples

      iex> create_quest_status(%{field: value})
      {:ok, %QuestStatus{}}

      iex> create_quest_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quest_status(attrs \\ %{}) do
    %QuestStatus{}
    |> QuestStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a quest_status.

  ## Examples

      iex> update_quest_status(quest_status, %{field: new_value})
      {:ok, %QuestStatus{}}

      iex> update_quest_status(quest_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quest_status(%QuestStatus{} = quest_status, attrs) do
    quest_status
    |> QuestStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a quest_status.

  ## Examples

      iex> delete_quest_status(quest_status)
      {:ok, %QuestStatus{}}

      iex> delete_quest_status(quest_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quest_status(%QuestStatus{} = quest_status) do
    Repo.delete(quest_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking quest_status changes.

  ## Examples

      iex> change_quest_status(quest_status)
      %Ecto.Changeset{data: %QuestStatus{}}

  """
  def change_quest_status(%QuestStatus{} = quest_status, attrs \\ %{}) do
    QuestStatus.changeset(quest_status, attrs)
  end
end
