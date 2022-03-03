defmodule Bb.ActivityTest do
  use Bb.DataCase

  alias Bb.Activity

  describe "book_statuses" do
    alias Bb.Activity.BookStatus

    import Bb.ActivityFixtures

    @invalid_attrs %{status: nil}

    test "list_book_statuses/0 returns all book_statuses" do
      book_status = book_status_fixture()
      assert Activity.list_book_statuses() == [book_status]
    end

    test "get_book_status!/1 returns the book_status with given id" do
      book_status = book_status_fixture()
      assert Activity.get_book_status!(book_status.id) == book_status
    end

    test "create_book_status/1 with valid data creates a book_status" do
      valid_attrs = %{status: "some status"}

      assert {:ok, %BookStatus{} = book_status} = Activity.create_book_status(valid_attrs)
      assert book_status.status == "some status"
    end

    test "create_book_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activity.create_book_status(@invalid_attrs)
    end

    test "update_book_status/2 with valid data updates the book_status" do
      book_status = book_status_fixture()
      update_attrs = %{status: "some updated status"}

      assert {:ok, %BookStatus{} = book_status} = Activity.update_book_status(book_status, update_attrs)
      assert book_status.status == "some updated status"
    end

    test "update_book_status/2 with invalid data returns error changeset" do
      book_status = book_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Activity.update_book_status(book_status, @invalid_attrs)
      assert book_status == Activity.get_book_status!(book_status.id)
    end

    test "delete_book_status/1 deletes the book_status" do
      book_status = book_status_fixture()
      assert {:ok, %BookStatus{}} = Activity.delete_book_status(book_status)
      assert_raise Ecto.NoResultsError, fn -> Activity.get_book_status!(book_status.id) end
    end

    test "change_book_status/1 returns a book_status changeset" do
      book_status = book_status_fixture()
      assert %Ecto.Changeset{} = Activity.change_book_status(book_status)
    end
  end

  describe "quest_statuses" do
    alias Bb.Activity.QuestStatus

    import Bb.ActivityFixtures

    @invalid_attrs %{completed: nil}

    test "list_quest_statuses/0 returns all quest_statuses" do
      quest_status = quest_status_fixture()
      assert Activity.list_quest_statuses() == [quest_status]
    end

    test "get_quest_status!/1 returns the quest_status with given id" do
      quest_status = quest_status_fixture()
      assert Activity.get_quest_status!(quest_status.id) == quest_status
    end

    test "create_quest_status/1 with valid data creates a quest_status" do
      valid_attrs = %{completed: 42}

      assert {:ok, %QuestStatus{} = quest_status} = Activity.create_quest_status(valid_attrs)
      assert quest_status.completed == 42
    end

    test "create_quest_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activity.create_quest_status(@invalid_attrs)
    end

    test "update_quest_status/2 with valid data updates the quest_status" do
      quest_status = quest_status_fixture()
      update_attrs = %{completed: 43}

      assert {:ok, %QuestStatus{} = quest_status} = Activity.update_quest_status(quest_status, update_attrs)
      assert quest_status.completed == 43
    end

    test "update_quest_status/2 with invalid data returns error changeset" do
      quest_status = quest_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Activity.update_quest_status(quest_status, @invalid_attrs)
      assert quest_status == Activity.get_quest_status!(quest_status.id)
    end

    test "delete_quest_status/1 deletes the quest_status" do
      quest_status = quest_status_fixture()
      assert {:ok, %QuestStatus{}} = Activity.delete_quest_status(quest_status)
      assert_raise Ecto.NoResultsError, fn -> Activity.get_quest_status!(quest_status.id) end
    end

    test "change_quest_status/1 returns a quest_status changeset" do
      quest_status = quest_status_fixture()
      assert %Ecto.Changeset{} = Activity.change_quest_status(quest_status)
    end
  end
end
