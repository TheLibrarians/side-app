defmodule Bb.ActivityFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bb.Activity` context.
  """

  @doc """
  Generate a book_status.
  """
  def book_status_fixture(attrs \\ %{}) do
    {:ok, book_status} =
      attrs
      |> Enum.into(%{
        status: "some status"
      })
      |> Bb.Activity.create_book_status()

    book_status
  end
end
