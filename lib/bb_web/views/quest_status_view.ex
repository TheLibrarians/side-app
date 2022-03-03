defmodule BbWeb.QuestStatusView do
  use BbWeb, :view
  alias BbWeb.QuestStatusView

  def render("index.json", %{quest_statuses: quest_statuses}) do
    %{data: render_many(quest_statuses, QuestStatusView, "quest_status.json")}
  end

  def render("show.json", %{quest_status: quest_status}) do
    %{data: render_one(quest_status, QuestStatusView, "quest_status.json")}
  end

  def render("quest_status.json", %{quest_status: quest_status}) do
    %{
      id: quest_status.id,
      completed: quest_status.completed
    }
  end
end
