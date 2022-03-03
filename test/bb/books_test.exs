defmodule Bb.BooksTest do
  use Bb.DataCase

  alias Bb.Books

  describe "books" do
    alias Bb.Books.Book

    import Bb.BooksFixtures

    @invalid_attrs %{cover: nil, description: nil, goodreads_url: nil, title: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Books.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{cover: "some cover", description: "some description", goodreads_url: "some goodreads_url", title: "some title"}

      assert {:ok, %Book{} = book} = Books.create_book(valid_attrs)
      assert book.cover == "some cover"
      assert book.description == "some description"
      assert book.goodreads_url == "some goodreads_url"
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{cover: "some updated cover", description: "some updated description", goodreads_url: "some updated goodreads_url", title: "some updated title"}

      assert {:ok, %Book{} = book} = Books.update_book(book, update_attrs)
      assert book.cover == "some updated cover"
      assert book.description == "some updated description"
      assert book.goodreads_url == "some updated goodreads_url"
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end
