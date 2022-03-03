defmodule Bb.QuestsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bb.Quests` context.
  """

  @doc """
  Generate a quest.
  """
  def quest_fixture(attrs \\ %{}) do
    {:ok, quest} =
      attrs
      |> Enum.into(%{
        description: "some description",
        tags: [],
        title: "some title"
      })
      |> Bb.Quests.create_quest()

    quest
  end
end
