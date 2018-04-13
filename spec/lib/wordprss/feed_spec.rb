require 'rspec'
require 'wordprss'

describe WordpRSS::Feed do

  describe "#title" do
    it 'returns feed title' do
      feed = WordpRSS::Feed.new(xml_feed)

      expect(feed.title).to eq('Feed title')
    end
  end

  describe '#description' do
    it 'returns feed description' do
      feed = WordpRSS::Feed.new(xml_feed)

      expect(feed.description).to eq('Feed description')
    end
  end

  describe '#items' do
    it 'returns feed items' do
      feed = WordpRSS::Feed.new(xml_feed)
      items = feed.items

      expect(items.size).to eq(1)
      expect(items.first).to be_instance_of(WordpRSS::Item)
    end
  end

  def xml_feed
    xml = <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
      <rss>
        <channel>
        <title>Feed title</title>
        <description>Feed description</description>
        <item>
          <title>Item title</title>
          <link>http://google.com</link>
          <pubDate>01/01/2018</pubDate>
          <description>Description</description>
          <category>Category 1</category>
          <category>Category 2</category>
        </item>
        </channel>
      </rss>
    XML
  end
end
