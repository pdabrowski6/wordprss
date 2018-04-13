module WordpRSS
  class Channel
    # Pull Wordpress RSS feed for given URL
    #
    # @return [WordpRSS::Feed]
    def self.subscribe(url)
      wordpress_url = WordpRSS::Url.parse(url)
      response = WordpRSS::Request.new(wordpress_url).call

      WordpRSS::Feed.new(response.body)
    end

    # Checks if the given URL points to the valid Wordpress RSS feed
    #
    # @return [Boolean]
    def self.wordpress_rss_feed?(url)
      wordpress_url = WordpRSS::Url.parse(url)
      response = WordpRSS::Request.new(wordpress_url).call

      WordpRSS::Policy.new.valid_rss_feed?(response)
    rescue RestClient::NotFound
      false
    end
  end
end
