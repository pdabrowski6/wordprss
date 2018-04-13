require 'rspec'
require 'wordprss'

describe WordpRSS::Policy do
  describe "#valid_rss_feed?" do
    it 'returns false if response is not a RSS feed' do
      response = double(body: "")

      policy = WordpRSS::Policy.new

      expect(policy.valid_rss_feed?(response)).to eq(false)
    end

    it 'returns false if response is not a Wordpress RSS feed' do
      response = double(body: response_body(generator: 'other'))

      policy = WordpRSS::Policy.new

      expect(policy.valid_rss_feed?(response)).to eq(false)
    end

    it 'returns true if response is a Wordpress RSS feed' do
      response = double(body: response_body)

      policy = WordpRSS::Policy.new

      expect(policy.valid_rss_feed?(response)).to eq(true)
    end
  end

  def response_body(generator: 'wordpress')
    xml = <<-XML
      <rss>
        <generator>#{generator}</generator>
      </rss>
    XML
  end
end
