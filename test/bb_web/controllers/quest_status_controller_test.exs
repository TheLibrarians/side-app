defmodule BbWeb.QuestStatusControllerTest do
  use BbWeb.ConnCase

  import Bb.ActivityFixtures

  alias Bb.Activity.QuestStatus

  @create_attrs %{
    completed: 42
  }
  @update_attrs %{
    completed: 43
  }
  @invalid_attrs %{completed: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all quest_statuses", %{conn: conn} do
      conn = get(conn, Routes.quest_status_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create quest_status" do
    test "renders quest_status when data is valid", %{conn: conn} do
      conn = post(conn, Routes.quest_status_path(conn, :create), quest_status: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.quest_status_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "completed" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.quest_status_path(conn, :create), quest_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update quest_status" do
    setup [:create_quest_status]

    test "renders quest_status when data is valid", %{conn: conn, quest_status: %QuestStatus{id: id} = quest_status} do
      conn = put(conn, Routes.quest_status_path(conn, :update, quest_status), quest_status: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.quest_status_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "completed" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, quest_status: quest_status} do
      conn = put(conn, Routes.quest_status_path(conn, :update, quest_status), quest_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete quest_status" do
    setup [:create_quest_status]

    test "deletes chosen quest_status", %{conn: conn, quest_status: quest_status} do
      conn = delete(conn, Routes.quest_status_path(conn, :delete, quest_status))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.quest_status_path(conn, :show, quest_status))
      end
    end
  end

  defp create_quest_status(_) do
    quest_status = quest_status_fixture()
    %{quest_status: quest_status}
  end
end
