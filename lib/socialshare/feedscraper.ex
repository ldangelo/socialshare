defmodule SocialshareWeb.FeedApi do
  @callback get_feed(url :: String.t()) :: {:ok, list()}
  @callback get_article(url :: String.t()) :: {:ok, Scrape.Article.t()}
end

defmodule SocialshareWeb.FeedScraperTestApi do
  @behaviour SocialshareWeb.FeedApi
  
  def get_feed(url) do
    [
      %{
        author: "Kim Ross",
        description: nil,
        image: nil,
        pubdate: DateTime.from_iso8601("2018-04-16 17:26:06+00:00 GMT GMT"),
        tags: [
          %{accuracy: 0.9, name: "leadership"},
          %{accuracy: 0.9, name: "fortium-partners"},
          %{accuracy: 0.9, name: "whyijoinedfortium"}
        ],
        title: "Why I joined Fortium Partners’ Cloud-Inspired Leadership Model",
        url: "https://blog.fortiumpartners.com/why-i-joined-fortium-partners-cloud-inspired-leadership-model-3a3ea7bab71a?source=rss----7e4ac868fb3---4"
      },
      %{
        author: "Brian Greenberg",
        description: nil,
        image: nil,
        pubdate: DateTime.from_iso8601("2018-02-19 22:37:09+00:00 GMT GMT"),
        tags: [
          %{accuracy: 0.9, name: "information-technology"},
          %{accuracy: 0.9, name: "devops"},
          %{accuracy: 0.9, name: "software-development"},
          %{accuracy: 0.9, name: "big-data"},
          %{accuracy: 0.9, name: "security"}
        ],
        title: "Three Considerations To Help You Get A Grip On Your Data.",
        url: "https://blog.fortiumpartners.com/three-considerations-to-help-you-get-a-grip-on-your-data-e0ccd0311a4f?source=rss----7e4ac868fb3---4"
      },
      %{
        author: "Fortium Partners",
        description: nil,
        image: nil,
        pubdate: DateTime.from_iso8601("2018-03-29 15:46:50+00:00 GMT GMT"),
        tags: [
          %{accuracy: 0.9, name: "technology"},
          %{accuracy: 0.9, name: "leadership"},
          %{accuracy: 0.9, name: "transformation"},
          %{accuracy: 0.9, name: "announcements"},
          %{accuracy: 0.9, name: "fortium-partners"}
        ],
        title: "CIO and Award-winning Technology Innovator Kim Ross Joins Fortium Partners",
        url: "https://blog.fortiumpartners.com/cio-and-award-winning-technology-innovator-kim-ross-joins-fortium-partners-b3a649fe2cf?source=rss----7e4ac868fb3---4"
      },
      %{
        author: "Fortium Partners",
        description: nil,
        image: nil,
        pubdate: DateTime.from_iso8601("2018-03-13 15:31:52+00:00 GMT GMT"),
        tags: [
          %{accuracy: 0.9, name: "announcements"},
          %{accuracy: 0.9, name: "fortium-partners"},
          %{accuracy: 0.9, name: "technology"},
          %{accuracy: 0.9, name: "leadership"},
          %{accuracy: 0.9, name: "transformation"}
        ],
        title: "Technology Transformation Leader Richard Eichen Joins Fortium Partners",
        url: "https://blog.fortiumpartners.com/technology-transformation-leader-richard-eichen-joins-fortium-partners-7373f103c4f?source=rss----7e4ac868fb3---4"
      },
      %{
        author: "Fortium Partners",
        description: nil,
        image: nil,
        pubdate: DateTime.from_iso8601("2018-02-21 14:22:57+00:00 GMT GMT"),
        tags: [
          %{accuracy: 0.9, name: "technology"},
          %{accuracy: 0.9, name: "leadership"},
          %{accuracy: 0.9, name: "announcements"},
          %{accuracy: 0.9, name: "fortium-partners"}
        ],
        title: "Internationally Known Technology & Change Management Executive John Roulat Joins Fortium Partners",
        url: "https://blog.fortiumpartners.com/internationally-known-technology-change-management-executive-john-roulat-joins-fortium-partners-5ee4663efa77?source=rss----7e4ac868fb3---4"
      },
      %{
        author: "Fortium Partners",
        description: nil,
        image: nil,
        pubdate: DateTime.from_iso8601("2018-01-25 22:07:59+00:00 GMT GMT"),
        tags: [
          %{accuracy: 0.9, name: "technology"},
          %{accuracy: 0.9, name: "technology-news"},
          %{accuracy: 0.9, name: "leadership"},
          %{accuracy: 0.9, name: "announcements"},
          %{accuracy: 0.9, name: "fortium"}
        ],
        title: "Transformative Enterprise Technology Advisor Turnaround Executive Tom Pankey Joins Fortium Partners",
        url: "https://blog.fortiumpartners.com/transformative-enterprise-technology-advisor-turnaround-executive-tom-pankey-joins-fortium-partners-775e1f356455?source=rss----7e4ac868fb3---4"
      },
      %{
        author: "Michael Wilson",
        description: nil,
        image: nil,
        pubdate: DateTime.from_iso8601("2018-01-24 18:47:22+00:00 GMT GMT"),
        tags: [
          %{accuracy: 0.9, name: "fortium"},
          %{accuracy: 0.9, name: "leadership"},
          %{accuracy: 0.9, name: "technology"}
        ],
        title: "What is LaaS (Leadership as a Service) all about?",
        url: "https://blog.fortiumpartners.com/what-is-laas-leadership-as-a-service-all-about-4ee7d150234d?source=rss----7e4ac868fb3---4"
      },
      %{
        author: "Fortium Partners",
        description: nil,
        image: nil,
        pubdate: DateTime.from_iso8601("2018-01-23 17:39:43+00:00 GMT GMT"),
        tags: [
          %{accuracy: 0.9, name: "leadership"},
          %{accuracy: 0.9, name: "announcements"},
          %{accuracy: 0.9, name: "technology-news"},
          %{accuracy: 0.9, name: "technology"},
          %{accuracy: 0.9, name: "fortium"}
        ],
        title: "Turnaround Specialist and Technology Process Expert Colin Drummond Joins Fortium Partners",
        url: "https://blog.fortiumpartners.com/turnaround-specialist-and-technology-process-expert-colin-drummond-joins-fortium-partners-25dfb5aeb72a?source=rss----7e4ac868fb3---4"
      },
      %{
        author: "Richard Harris",
        description: nil,
        image: nil,
        pubdate: DateTime.from_iso8601("2018-01-10 22:58:38+00:00 GMT GMT"),
        tags: [
          %{accuracy: 0.9, name: "information-technology"},
          %{accuracy: 0.9, name: "cio"},
          %{accuracy: 0.9, name: "leadership"},
          %{accuracy: 0.9, name: "digital-transformation"}
        ],
        title: "You might not need a full time Chief Information Officer",
        url: "https://blog.fortiumpartners.com/you-might-not-need-a-full-time-chief-information-officer-27b90e7e0820?source=rss----7e4ac868fb3---4"
      },
      %{
        author: "Brian Greenberg",
        description: nil,
        image: nil,
        pubdate: DateTime.from_iso8601("2018-01-10 21:26:34+00:00 GMT GMT"),
        tags: [
          %{accuracy: 0.9, name: "big-data"},
          %{accuracy: 0.9, name: "cybersecurity"}
        ],
        title: "Three Considerations To Help You Better Secure And Control Your Data",
        url: "https://blog.fortiumpartners.com/three-considerations-to-help-you-better-secure-and-control-your-data-9b7fca2c0b5e?source=rss----7e4ac868fb3---4"
      }
    ]
  end

  def scrape_article(url) do
    %Scrape.Article{
      description: "As a technology leader, my best experiences have been in situations where I brought clear and measurable benefit to the business, and to the people I am working with. Envisioning great business…",
      favicon: "https://cdn-static-1.medium.com/_/fp/icons/favicon-rebrand-medium.3Y6xpZ-0FSdWDnPM3hSBIA.ico",
      feeds: [],
      fulltext: "As a technology leader, my best experiences have been in situations where I brought clear and measurable benefit to the business, and to the people I am working with. Envisioning great business outcomes, and then leading high performing teams to achieve those goals quickly, is a passion of mine.\n\nBusiness value, today, must be driven by rapid response — to drive profitable operations, to react quickly to competitive pressure, and to execute on disruptive strategies to achieve market leadership. To achieve this, companies must be quick and agile in acquiring the resources that they need to do the job — including executive leadership talent.\n\nWhile companies look to employ the best of new digital technologies to drive business advantage, they can look to Fortium Partners to rapidly fill key roles with strong and dependable leadership — professionals experienced with driving innovation while building organizational strength and performance. This leadership acquisition model lines up very well with the latest IT strategies characterized by cloud-based provisioning — the ability to acquire breakthrough capabilities with low entry effort, with low long-term risk, and at cost proportionate to the needs. I will enjoy being a partner, providing leadership to companies that see the business benefits of this model.\n\nFortium Partners’ leadership model will allow companies of all sizes and growth stages to get the right technology leadership, in an engagement sized to fit the budget. Fortium Partners represents a disruptive force in IT leadership provisioning. Cloud computing has equalized the field for companies, large and small, to acquire the best in digital technologies. In the same fashion, Fortium has enabled companies to acquire the best in technology leadership in right-sized portion — full-time, fractional, or virtual— with less risk and effort than the traditional hiring model. I am excited to have my leadership skills and experience made available to clients in this model.\n\nI look forward to being part of Fortium Partner’s innovative IT leadership team. During my career, I have built up deep experience in brining rapid business value through well planned innovation. I have enjoined taking teams through periods of growth and transition, while building a high performance, positively-engaged organizations along the way. I anticipate that Fortium Partners will position me to well bring these capabilities to companies of all sizes, in times of their most critical need.",
      image: "https://cdn-images-1.medium.com/max/1200/1*c6SyH00EeyESgLC91P4vVA.png",
      tags: [
        %{accuracy: 1, name: "leadership"},
        %{accuracy: 0.9491525423728814, name: "fortium"},
        %{accuracy: 0.5932203389830508, name: "joined"},
        %{accuracy: 0.5338983050847458, name: "best"},
        %{accuracy: 0.5338983050847458, name: "modelwhy"},
        %{accuracy: 0.4745762711864407, name: "technology"},
        %{accuracy: 0.35593220338983056, name: "companies"},
        %{accuracy: 0.35593220338983056, name: "brought"},
        %{accuracy: 0.35593220338983056, name: "envisioning"},
        %{accuracy: 0.35593220338983056, name: "great"},
        %{accuracy: 0.35593220338983056, name: "situations"},
        %{accuracy: 0.35593220338983056, name: "working"},
        %{accuracy: 0.35593220338983056, name: "benefit"},
        %{accuracy: 0.35593220338983056, name: "experiences"},
        %{accuracy: 0.35593220338983056, name: "people"},
        %{accuracy: 0.35593220338983056, name: "clear"},
        %{accuracy: 0.35593220338983056, name: "measurable"},
        %{accuracy: 0.2966101694915254, name: "business"},
        %{accuracy: 0.17796610169491528, name: "acquire"},
        %{accuracy: 0.17796610169491528, name: "well"}
  ],
  title: "Why I joined Fortium Partners’ Cloud-Inspired Leadership Model",
  url: "https://blog.fortiumpartners.com/why-i-joined-fortium-partners-cloud-inspired-leadership-model-3a3ea7bab71a"
}
  end
end

defmodule SocialshareWeb.FeedScraperApi do
  @behaviour SocialshareWeb.FeedApi

  def get_feed(url) do
    Scrape.feed url
  end

  def get_article(url) do
    Scrape.article(url)
  end
end

defmodule SocialshareWeb.FeedScraper do

  require Logger

  @feed_api Application.get_env(:socialshare, :feed_api)
  def scrape_feed(url) do
    Logger.info "Scraping feed " 
    posts = @feed_api.get_feed url

    Enum.each posts, fn item ->
      article = @feed_api.get_article item[:url]

      post = %{image: article.image,
                   description: article.description,
                   title: article.title,
                   url: item[:url],
                   author: item[:author],
                   pubdate: item[:pubdate],
                   comment: "More exciting news from FortiumPartners!",
                   shared: false}


      # Logger.info "#{inspect(post)}"

      
      if (!Socialshare.Social.find_post_by_url(item[:url])) do
        Socialshare.Social.create_post(post)
      end
      #
      # save tags associated with this post
      #Enum.each article.tags, fn tag ->
        
      #end
    end
  end
end
