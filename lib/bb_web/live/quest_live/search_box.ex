defmodule BbWeb.QuestLive.SearchBox do
  use BbWeb, :live_component

  @impl true
  def update(_, socket) do
    {:ok, socket |> assign(:answer, "") |> assign_books()}
  end

  def assign_books(socket) do
    socket |> assign(:books, Bb.Books.list_books())
  end

  @impl true
  def handle_event("validate", %{"search" => search}, socket) do
    if String.length(search) < 1 do
      {:noreply, socket |> assign(:books, Bb.Books.list_books()) |> assign_answer(search)}
    else
      books = Bb.Books.search(search)
      {:noreply, socket |> assign(:books, books) |> assign_answer(search)}
    end
  end

  @impl true
  def handle_event("select", %{"idx" => idx}, socket) do
    {i, _} = Integer.parse(idx)

    case Enum.at(socket.assigns.books, i) do
      nil ->
        IO.puts("something went wrong...")

      book ->
        send_update(BbWeb.QuestLive.FormComponent, id: "quest-form", action: {:selected, book})
    end

    {:noreply, socket}
  end

  def assign_answer(socket, answer) do
    assign(socket, :answer, answer)
  end
end
