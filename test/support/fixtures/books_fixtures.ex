defmodule Bb.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bb.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        cover: "some cover",
        description: "some description",
        goodreads_url: "some goodreads_url",
        title: "some title"
      })
      |> Bb.Books.create_book()

    book
  end
end
