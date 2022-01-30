defmodule FormDemoWeb.PageLive do
  use FormDemoWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end

    socket = assign(socket,
      auction_type: "online",
      catalog_number: "",
    )

    {:ok, set_time(socket)}
  end

  def handle_event("form_changed", %{"type" => type} = values, socket) do
    socket = assign(socket, auction_type: type)

    socket =
      case values do
        %{"catalog_number" => number} -> assign(socket, catalog_number: number)
        _ -> socket
      end

    {:noreply, socket}
  end

  def handle_info(:tick, socket) do
    {:noreply, set_time(socket)}
  end

  defp set_time(socket) do
    assign(socket, time: NaiveDateTime.local_now())
  end
end
