defmodule ShortenApiWeb.LinkController do
  use SurlWeb, :controller

  alias Surl.Links
  def get_and_redirect(conn, %{"hash" => hash}) do
    url = Links.get_link_url(hash)
    IO.puts( url)
    redirect(conn, external: url)
  end
end
