defmodule BbWeb.PageController do
  use BbWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
