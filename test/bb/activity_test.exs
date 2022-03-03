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
end
