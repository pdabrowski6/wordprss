module WordpRSS
  class Policy
    # Returns the result of the RSS feed validation. The RSS generator must be wordpress
    #
    # @return [Boolean]
    def valid_rss_feed?(response)
      xml = Nokogiri::XML(response.body)

      !!(!xml.at("rss").nil? && xml.at("generator").text.to_s.match(/wordpress/i))
    end
  end
end
