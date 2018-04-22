require 'rspec'
require 'wordprss'

describe WordpRSS::Item do
  before(:all) { @item = WordpRSS::Item.new(nokogiri_node) }

  describe "#title" do
    it 'returns item title' do
      expect(@item.title).to eq('Item title')
    end
  end

  describe '#link' do
    it 'returns item link' do
      expect(@item.link).to eq('http://google.com')
    end
  end

  describe '#published_at' do
    it 'returns item publication date' do
      expect(@item.published_at).to eq('01/01/2018')
    end
  end

  describe '#description' do
    it 'returns item description' do
      expect(@item.description).to eq('Description')
    end
  end

  describe '#creator' do
    it 'returns item creator' do
      expect(@item.creator).to eq('John Doe')
    end

    it 'returns nil if creator node is not found' do
      blank_node = Nokogiri::XML("<item></item>")

      expect(WordpRSS::Item.new(blank_node).creator).to eq(nil)
    end
  end

  describe '#tags' do
    it 'returns item tags' do
      expect(@item.tags).to eq(['Category 1', 'Category 2'])
    end
  end

  def nokogiri_node
    xml = <<-XML
      <item>
        <title>Item title</title>
        <link>http://google.com</link>
        <pubDate>01/01/2018</pubDate>
        <description>Description</description>
        <category>Category 1</category>
        <category>Category 2</category>
        <dc:creator>John Doe</dc:creator>
      </item>
    XML

    ::Nokogiri::XML(xml)
  end
end
