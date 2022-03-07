# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bb.Repo.insert!(%Bb.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Seeds.Importer do
  alias NimbleCSV.RFC4180, as: CSV

  alias Bb.Books
  alias Bb.Repo

  def get_column_names(file) do
    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: false)
    |> Enum.fetch!(0)
    |> Enum.with_index()
    |> Map.new(fn {val, num} -> {num, val} end)
  end

  def csv_row_to_table_record(file) do
    column_names = get_column_names(file)

    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: true)
    |> Enum.map(fn row ->
      row
      |> Enum.with_index()
      |> Map.new(fn {val, num} -> {column_names[num], val} end)
      |> change_to_book_struct()
    end)
    |> insert_all
  end

  def change_to_book_struct(data) do
    %{
      "author_name" => author_name,
      "cover" => cover,
      "description" => desc,
      "goodreads_url" => goodreads_url,
      "title" => title
    } = data

    %{
      author_name: author_name,
      cover: cover,
      description: desc,
      goodreads_url: goodreads_url,
      title: title
    }
  end

  def insert_all(data) do
    IO.inspect(data |> Enum.count(), label: "csv rows")
    result = Books.upsert_books(data)
    IO.inspect(result |> Enum.count(), label: "books added")
  end
end

Seeds.Importer.csv_row_to_table_record("priv/repo/mock_books.csv")
