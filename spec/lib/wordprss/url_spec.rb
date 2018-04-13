require 'rspec'
require 'wordprss'

describe WordpRSS::Url do
  describe '.parse' do
    it 'returns nil if given URL is nil' do
      expect(WordpRSS::Url.parse(nil)).to eq(nil)
    end

    it 'does not duplicate feed part if given URL contains feed part' do
      expect(WordpRSS::Url.parse("http://blog.com/feed")).to eq("http://blog.com/feed")
    end

    it 'adds feed part if given URL does not contain feed part' do
      expect(WordpRSS::Url.parse("http://blog.com")).to eq("http://blog.com/feed")
    end
  end
end
