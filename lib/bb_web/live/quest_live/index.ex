defmodule BbWeb.QuestLive.Index do
  use BbWeb, :live_view

  alias Bb.Quests
  alias Bb.Quests.Quest

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :quests, list_quests())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Quest")
    |> assign(:quest, Quests.get_quest_with_books!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Quest")
    |> assign(:quest, %Quest{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Quests")
    |> assign(:quest, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    quest = Quests.get_quest!(id)

    case Quests.delete_quest(quest) do
      {:ok, _} ->
        {:noreply, assign(socket, :quests, list_quests())}

      {:error, changeset} ->
        IO.inspect(changeset, label: "error deleting!!")
        {:noreply, socket}
    end
  end

  @doc """
  Callback when book is selected from the search box
  """
  @impl true
  def handle_info({:selected, book}, socket) do
    IO.inspect(book.title)
    {:noreply, socket}
  end

  defp list_quests do
    Quests.list_quests()
  end
end
