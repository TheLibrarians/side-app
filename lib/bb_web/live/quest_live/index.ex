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
    |> assign(:quest, Quests.get_quest!(id))
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
    {:ok, _} = Quests.delete_quest(quest)

    {:noreply, assign(socket, :quests, list_quests())}
  end

  defp list_quests do
    Quests.list_quests()
  end
end