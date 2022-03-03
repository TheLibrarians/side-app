defmodule BbWeb.BookStatusControllerTest do
  use BbWeb.ConnCase

  import Bb.ActivityFixtures

  alias Bb.Activity.BookStatus

  @create_attrs %{
    status: "some status"
  }
  @update_attrs %{
    status: "some updated status"
  }
  @invalid_attrs %{status: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all book_statuses", %{conn: conn} do
      conn = get(conn, Routes.book_status_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create book_status" do
    test "renders book_status when data is valid", %{conn: conn} do
      conn = post(conn, Routes.book_status_path(conn, :create), book_status: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.book_status_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.book_status_path(conn, :create), book_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update book_status" do
    setup [:create_book_status]

    test "renders book_status when data is valid", %{conn: conn, book_status: %BookStatus{id: id} = book_status} do
      conn = put(conn, Routes.book_status_path(conn, :update, book_status), book_status: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.book_status_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, book_status: book_status} do
      conn = put(conn, Routes.book_status_path(conn, :update, book_status), book_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete book_status" do
    setup [:create_book_status]

    test "deletes chosen book_status", %{conn: conn, book_status: book_status} do
      conn = delete(conn, Routes.book_status_path(conn, :delete, book_status))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.book_status_path(conn, :show, book_status))
      end
    end
  end

  defp create_book_status(_) do
    book_status = book_status_fixture()
    %{book_status: book_status}
  end
end
