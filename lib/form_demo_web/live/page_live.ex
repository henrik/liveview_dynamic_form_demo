defmodule FormDemoWeb.PageLive do
  use FormDemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end

    {:ok, set_time(socket)}
  end

  @impl true
  def handle_info(:tick, socket) do
    {:noreply, set_time(socket)}
  end

  defp set_time(socket) do
    assign(socket, time: NaiveDateTime.local_now())
  end
end
