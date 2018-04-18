defmodule SocialshareWeb.FeedScraper do

  require Logger
  alias Socialshare.Social.Post 

  def scrape_feed(url) do
    Logger.info "Scraping feed " 
    posts = Scrape.feed url

    Enum.each posts, fn item ->
      article = Scrape.article item[:url]

      post = %Post{image: article.image,
                   description: article.description,
                   title: article.title,
                   url: item[:url],
                   author: item[:author],
                   pubdate: item[:pubdate],
                   comment: "More exciting news from FortiumPartners!",
                   shared: false}
   
      Logger.info "#{inspect(post)}"
    end
  end

end
