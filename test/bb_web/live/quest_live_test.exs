defmodule BbWeb.QuestLiveTest do
  use BbWeb.ConnCase

  import Phoenix.LiveViewTest
  import Bb.QuestsFixtures

  @create_attrs %{description: "some description", tags: [], title: "some title"}
  @update_attrs %{description: "some updated description", tags: [], title: "some updated title"}
  @invalid_attrs %{description: nil, tags: [], title: nil}

  defp create_quest(_) do
    quest = quest_fixture()
    %{quest: quest}
  end

  describe "Index" do
    setup [:create_quest]

    test "lists all quests", %{conn: conn, quest: quest} do
      {:ok, _index_live, html} = live(conn, Routes.quest_index_path(conn, :index))

      assert html =~ "Listing Quests"
      assert html =~ quest.description
    end

    test "saves new quest", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.quest_index_path(conn, :index))

      assert index_live |> element("a", "New Quest") |> render_click() =~
               "New Quest"

      assert_patch(index_live, Routes.quest_index_path(conn, :new))

      assert index_live
             |> form("#quest-form", quest: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#quest-form", quest: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.quest_index_path(conn, :index))

      assert html =~ "Quest created successfully"
      assert html =~ "some description"
    end

    test "updates quest in listing", %{conn: conn, quest: quest} do
      {:ok, index_live, _html} = live(conn, Routes.quest_index_path(conn, :index))

      assert index_live |> element("#quest-#{quest.id} a", "Edit") |> render_click() =~
               "Edit Quest"

      assert_patch(index_live, Routes.quest_index_path(conn, :edit, quest))

      assert index_live
             |> form("#quest-form", quest: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#quest-form", quest: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.quest_index_path(conn, :index))

      assert html =~ "Quest updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes quest in listing", %{conn: conn, quest: quest} do
      {:ok, index_live, _html} = live(conn, Routes.quest_index_path(conn, :index))

      assert index_live |> element("#quest-#{quest.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#quest-#{quest.id}")
    end
  end

  describe "Show" do
    setup [:create_quest]

    test "displays quest", %{conn: conn, quest: quest} do
      {:ok, _show_live, html} = live(conn, Routes.quest_show_path(conn, :show, quest))

      assert html =~ "Show Quest"
      assert html =~ quest.description
    end

    test "updates quest within modal", %{conn: conn, quest: quest} do
      {:ok, show_live, _html} = live(conn, Routes.quest_show_path(conn, :show, quest))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Quest"

      assert_patch(show_live, Routes.quest_show_path(conn, :edit, quest))

      assert show_live
             |> form("#quest-form", quest: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#quest-form", quest: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.quest_show_path(conn, :show, quest))

      assert html =~ "Quest updated successfully"
      assert html =~ "some updated description"
    end
  end
end
