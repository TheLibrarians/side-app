defmodule Bb.Quests do
  @moduledoc """
  The Quests context.
  """

  import Ecto.Query, warn: false
  alias Bb.Repo

  alias Bb.Quests.Quest

  @doc """
  Returns the list of quests.

  ## Examples

      iex> list_quests()
      [%Quest{}, ...]

  """
  def list_quests do
    Repo.all(from q in Quest, order_by: q.updated_at) |> Repo.preload(:books)
  end

  @doc """
  Gets a single quest.

  Raises `Ecto.NoResultsError` if the Quest does not exist.

  ## Examples

      iex> get_quest!(123)
      %Quest{}

      iex> get_quest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quest!(id), do: Repo.get!(Quest, id)

  def get_quest_with_books!(id) do
    Repo.get!(Quest, id) |> Repo.preload(:books)
  end

  @doc """
  For testing purposes -- loads a quest
  """
  def sample_quest do
    Bb.Quests.get_quest!(7) |> Repo.preload(:books)
  end

  @doc """
  Creates a quest.

  ## Examples

      iex> create_quest(%{field: value})
      {:ok, %Quest{}}

      iex> create_quest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quest(attrs \\ %{}) do
    %Quest{}
    |> Quest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Create a quest with books
  """
  def create_quest(attrs, books) do
    %Quest{}
    |> Quest.changeset(attrs, books)
    |> Repo.insert()
  end

  @doc """
  Updates a quest.

  ## Examples

      iex> update_quest(quest, %{field: new_value})
      {:ok, %Quest{}}

      iex> update_quest(quest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quest(%Quest{} = quest, attrs) do
    quest
    |> Quest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Updates a quest with books
  """
  def update_quest(%Quest{} = quest, attrs, books) do
    quest
    |> Quest.changeset(attrs, books)
    |> Repo.update()
  end

  @doc """
  Deletes a quest.

  ## Examples

      iex> delete_quest(quest)
      {:ok, %Quest{}}

      iex> delete_quest(quest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quest(%Quest{} = quest) do
    Repo.delete(quest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking quest changes.

  ## Examples

      iex> change_quest(quest)
      %Ecto.Changeset{data: %Quest{}}

  """
  def change_quest(%Quest{} = quest, attrs \\ %{}) do
    Quest.changeset(quest, attrs)
  end
end
