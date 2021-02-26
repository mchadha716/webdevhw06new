defmodule BullsCowsWeb.PageController do
  use BullsCowsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
