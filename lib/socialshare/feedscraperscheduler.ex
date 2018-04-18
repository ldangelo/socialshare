defmodule SocialshareWeb.FeedScraperScheduler do
  use GenServer

  alias SocialshareWeb.FeedScraper
  require Logger

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  def handle_info(:scrape, state) do
    scrape_feed()
    schedule_work()
    {:noreply, state}
  end

  defp scrape_feed() do
   FeedScraper.scrape_feed System.get_env("FEED_URL") 
  end

  defp schedule_work() do
    timer = System.get_env("SCRAPETIMER");
    if timer do
      Logger.info "Scheduling feed scrape"
      Process.send_after(self(), :scrape, String.to_integer(timer)) # every minute
    else
      Logger.error "Environment variable SCRAPETIMER is not set"
    end
  end
end
