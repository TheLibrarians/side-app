defmodule BbWeb.QuestLive.FormComponent do
  use BbWeb, :live_component

  alias Bb.Quests

  @doc """
  Handler for the send_update message. Adds the books to the in-memory structure
  """
  @impl true
  def update(%{action: {:selected, book}}, socket) do
    books = socket.assigns.books |> Map.put(book.id, book)
    {:ok, assign_books(socket, books)}
  end

  @impl true
  def update(%{quest: quest} = assigns, socket) do
    changeset = Quests.change_quest(quest)

    # map prevents duplicates from being added?
    # we can't use quest.books if it's a new changeset!
    # here, relying on changeset not being valid if it is new
    books_map =
      if changeset.valid?,
        do: quest.books |> Enum.into(%{}, fn book -> {book.id, book} end),
        else: %{}

    {:ok,
     socket
     |> assign(assigns)
     |> assign_books(books_map)
     |> assign(:changeset, changeset)}
  end

  def assign_books(socket, books_map) do
    socket
    |> assign(:books, books_map)
  end

  def handle_event("delete-book", %{"send" => idx}, socket) do
    {idx, _} = Integer.parse(idx)
    books_map = socket.assigns.books |> Map.delete(idx)
    {:noreply, assign_books(socket, books_map)}
  end

  @impl true
  def handle_event("validate", %{"quest" => quest_params}, socket) do
    changeset =
      socket.assigns.quest
      |> Quests.change_quest(quest_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"quest" => quest_params}, socket) do
    save_quest(socket, socket.assigns.action, quest_params)
  end

  defp save_quest(socket, :edit, quest_params) do
    books = socket.assigns.books

    case Quests.update_quest(socket.assigns.quest, quest_params, books) do
      {:ok, _quest} ->
        {:noreply,
         socket
         |> put_flash(:info, "Quest updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_quest(socket, :new, quest_params) do
    books = socket.assigns.books

    case Quests.create_quest(quest_params, books) do
      {:ok, _quest} ->
        {:noreply,
         socket
         |> put_flash(:info, "Quest created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
