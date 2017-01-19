defmodule ScatOnSlack.API.PageController do
  use ScatOnSlack.API.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
