defmodule BbWeb.QuestLive.FormComponent do
  use BbWeb, :live_component

  alias Bb.Quests

  @impl true
  def update(%{quest: quest} = assigns, socket) do
    changeset = Quests.change_quest(quest)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
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
    case Quests.update_quest(socket.assigns.quest, quest_params) do
      {:ok, _quest} ->
        {:noreply,
         socket
         |> put_flash(:info, "Quest updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_quest(socket, :new, quest_params) do
    case Quests.create_quest(quest_params) do
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
