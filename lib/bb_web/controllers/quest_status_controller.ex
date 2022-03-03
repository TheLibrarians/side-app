defmodule BbWeb.QuestStatusController do
  use BbWeb, :controller

  alias Bb.Activity
  alias Bb.Activity.QuestStatus

  action_fallback BbWeb.FallbackController

  def index(conn, _params) do
    quest_statuses = Activity.list_quest_statuses()
    render(conn, "index.json", quest_statuses: quest_statuses)
  end

  def create(conn, %{"quest_status" => quest_status_params}) do
    with {:ok, %QuestStatus{} = quest_status} <- Activity.create_quest_status(quest_status_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.quest_status_path(conn, :show, quest_status))
      |> render("show.json", quest_status: quest_status)
    end
  end

  def show(conn, %{"id" => id}) do
    quest_status = Activity.get_quest_status!(id)
    render(conn, "show.json", quest_status: quest_status)
  end

  def update(conn, %{"id" => id, "quest_status" => quest_status_params}) do
    quest_status = Activity.get_quest_status!(id)

    with {:ok, %QuestStatus{} = quest_status} <- Activity.update_quest_status(quest_status, quest_status_params) do
      render(conn, "show.json", quest_status: quest_status)
    end
  end

  def delete(conn, %{"id" => id}) do
    quest_status = Activity.get_quest_status!(id)

    with {:ok, %QuestStatus{}} <- Activity.delete_quest_status(quest_status) do
      send_resp(conn, :no_content, "")
    end
  end
end
