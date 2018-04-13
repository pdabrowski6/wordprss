require 'rspec'
require 'wordprss'

describe WordpRSS::Request do
  describe '#call' do
    it 'raises WordpRSS::InvalidURLError error when given URL is invalid' do
      request = WordpRSS::Request.new('invalid url')

      expect { request.call }.to raise_error(WordpRSS::InvalidURLError, 'invalid url is not a valid URL')
    end

    it 'performs request' do
      url = 'http://blog.com/feed'
      response = double('response')
      allow(RestClient).to receive(:get).with(url).and_return(response)

      request = WordpRSS::Request.new(url)
      result = request.call

      expect(result).to eq(response)
      expect(RestClient).to have_received(:get).with(url).once
    end
  end
end
