defmodule BbWeb.BookStatusView do
  use BbWeb, :view
  alias BbWeb.BookStatusView

  def render("index.json", %{book_statuses: book_statuses}) do
    %{data: render_many(book_statuses, BookStatusView, "book_status.json")}
  end

  def render("show.json", %{book_status: book_status}) do
    %{data: render_one(book_status, BookStatusView, "book_status.json")}
  end

  def render("book_status.json", %{book_status: book_status}) do
    %{
      id: book_status.id,
      status: book_status.status
    }
  end
end
