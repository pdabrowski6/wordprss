module WordpRSS
  class Item
    def initialize(node)
      @node = node
    end

    # Returns the item title
    #
    # @return [String]
    def title
      node.at("title").text
    end

    # Returns the item link
    #
    # @return [String]
    def link
      node.at("link").text
    end

    # Returns the item publication date
    #
    # @return [String]
    def published_at
      node.at("pubDate").text
    end

    # Returns the item description
    #
    # @return [String]
    def description
      node.at("description").text
    end

    # Returns an array of the item categories
    #
    # @return [Array<String>]
    def tags
      node.css("category").map(&:text)
    end

    # Returns item author
    #
    # @return [String]
    def creator
      node.elements.last.children.find { |c| c.name == "dc:creator" }.text
    end

    private

    attr_accessor :node
  end
end
