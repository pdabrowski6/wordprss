require 'uri'

module WordpRSS
  class Url
    # Parses given URL to get the version with the /feed
    #
    # @return [String]
    def self.parse(url)
      return url if url.nil? || url.match(/\/feed$/)

      "#{url}/feed"
    end
  end
end
