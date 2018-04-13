require 'nokogiri'

module WordpRSS
  class Feed

    def initialize(body)
      @body = body
    end

    # Returns the RSS feed title
    #
    # @return [String]
    def title
      xml.xpath("//channel").at("title").text
    end

    # Returns the RSS feed description
    #
    # @return [String]
    def description
      xml.xpath("//channel").at("description").text
    end

    # Returns a collection of the RSS feed items
    #
    # @return [Array<WordpRSS::Item>]
    def items
      xml.css("item").map do |node|
        ::WordpRSS::Item.new(node)
      end
    end

    private

    attr_reader :body

    def xml
      @xml ||= ::Nokogiri::XML(body)
    end
  end
end
