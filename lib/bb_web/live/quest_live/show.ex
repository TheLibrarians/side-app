defmodule BbWeb.QuestLive.Show do
  use BbWeb, :live_view

  alias Bb.Quests

  @bg_choices %{
    hyper: "bg-gradient-to-r from-pink-500 via-red-500 to-yellow-500",
    cotton_candy: "bg-gradient-to-r from-pink-300 via-purple-300 to-indigo-400",
    gotham: "bg-gradient-to-r from-gray-700 via-gray-900 to-black"
  }

  @impl true
  def mount(_params, _session, socket) do
    IO.puts("we are here")
    {:ok, socket |> assign_theme()}
  end

  def assign_theme(socket) do
    socket
    |> assign(:theme, @bg_choices[:gotham])
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:quest, Quests.get_quest_with_books!(id))
     |> assign_theme()}
  end

  defp page_title(:show), do: "Show Quest"
  defp page_title(:edit), do: "Edit Quest"
end
