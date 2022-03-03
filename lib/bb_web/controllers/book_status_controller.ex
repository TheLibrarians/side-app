defmodule BbWeb.BookStatusController do
  use BbWeb, :controller

  alias Bb.Activity
  alias Bb.Activity.BookStatus

  action_fallback BbWeb.FallbackController

  def index(conn, _params) do
    book_statuses = Activity.list_book_statuses()
    render(conn, "index.json", book_statuses: book_statuses)
  end

  def create(conn, %{"book_status" => book_status_params}) do
    with {:ok, %BookStatus{} = book_status} <- Activity.create_book_status(book_status_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.book_status_path(conn, :show, book_status))
      |> render("show.json", book_status: book_status)
    end
  end

  def show(conn, %{"id" => id}) do
    book_status = Activity.get_book_status!(id)
    render(conn, "show.json", book_status: book_status)
  end

  def update(conn, %{"id" => id, "book_status" => book_status_params}) do
    book_status = Activity.get_book_status!(id)

    with {:ok, %BookStatus{} = book_status} <- Activity.update_book_status(book_status, book_status_params) do
      render(conn, "show.json", book_status: book_status)
    end
  end

  def delete(conn, %{"id" => id}) do
    book_status = Activity.get_book_status!(id)

    with {:ok, %BookStatus{}} <- Activity.delete_book_status(book_status) do
      send_resp(conn, :no_content, "")
    end
  end
end
