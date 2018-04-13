require 'uri'
require 'rest-client'

module WordpRSS
  class Request
    def initialize(url)
      @url = url
    end

    # Performs the request to the given URL in order to get the RSS feed contents
    #
    # @return [RestClient::Response]
    def call
      fail(WordpRSS::InvalidURLError.new("#{url} is not a valid URL")) unless url =~ URI::regexp

      RestClient.get(url)
    end

    private

    attr_reader :url
  end
end
