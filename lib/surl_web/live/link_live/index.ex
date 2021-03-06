defmodule SurlWeb.LinkLive.Index do
  use SurlWeb, :live_view

  alias Surl.Links
  alias Surl.Links.Link

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Surl.Links.subscribe()
    {:ok, assign(socket, :links, fetch_links())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Link")
    |> assign(:link, Links.get_link!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Link")
    |> assign(:link, %Link{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Links")
    |> assign(:link, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    link = Links.get_link!(id)
    {:ok, _} = Links.delete_link(link)

    {:noreply, update(socket, :links, fetch_links())}
  end

  @impl true
  def handle_info({:url_used, link}, socket) do
    {:noreply, update(socket, :links, fn links -> [link|links] end)}
  end

  defp fetch_links do
    Links.list_links()
  end
end
