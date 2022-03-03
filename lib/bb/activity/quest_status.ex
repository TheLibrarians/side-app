defmodule Bb.Activity.QuestStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quest_statuses" do
    field :completed, :integer
    field :user_id, :id
    field :quest_id, :id

    timestamps()
  end

  @doc false
  def changeset(quest_status, attrs) do
    quest_status
    |> cast(attrs, [:completed])
    |> validate_required([:completed])
  end
end
