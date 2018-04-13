require 'rspec'
require 'wordprss'

describe WordpRSS::Channel do
  describe '.wordpress_rss_feed?' do
    it 'returns true if given feed is a wordpress feed' do
      url = 'http://blog.com/feed'
      allow(WordpRSS::Url).to receive(:parse).with(url).and_return(url)
      response = double('response')
      request = instance_double(WordpRSS::Request, call: response)
      allow(WordpRSS::Request).to receive(:new).with(url).and_return(request)
      policy = instance_double(WordpRSS::Policy, valid_rss_feed?: double)
      allow(WordpRSS::Policy).to receive(:new).and_return(policy)
      allow(policy).to receive(:valid_rss_feed?).with(response).and_return(true)

      expect(WordpRSS::Channel.wordpress_rss_feed?(url)).to eq(true)
    end

    it 'returns false if given feed is not a wordpress feed' do
      url = 'http://blog.com/feed'
      allow(WordpRSS::Url).to receive(:parse).with(url).and_return(url)
      response = double('response')
      request = instance_double(WordpRSS::Request, call: response)
      allow(WordpRSS::Request).to receive(:new).with(url).and_return(request)
      policy = instance_double(WordpRSS::Policy, valid_rss_feed?: double)
      allow(WordpRSS::Policy).to receive(:new).and_return(policy)
      allow(policy).to receive(:valid_rss_feed?).with(response).and_return(false)

      expect(WordpRSS::Channel.wordpress_rss_feed?(url)).to eq(false)
    end

    it 'returns false if given feed is not found' do
      url = 'http://blog.com/feed'
      allow(WordpRSS::Url).to receive(:parse).with(url).and_return(url)
      response = double('response')
      request = instance_double(WordpRSS::Request, call: response)
      allow(WordpRSS::Request).to receive(:new).with(url).and_return(request)
      allow(request).to receive(:call).and_raise(RestClient::NotFound)

      expect(WordpRSS::Channel.wordpress_rss_feed?(url)).to eq(false)
    end
  end

  describe '.subscribe' do
    it 'subscribes to the RSS feed' do
      url = 'http://blog.com/feed'
      allow(WordpRSS::Url).to receive(:parse).with(url).and_return(url)
      response = double('response', body: 'body')
      request = instance_double(WordpRSS::Request, call: response)
      allow(WordpRSS::Request).to receive(:new).with(url).and_return(request)
      feed = instance_double(WordpRSS::Feed)
      allow(WordpRSS::Feed).to receive(:new).with(response.body).and_return(feed)

      result = WordpRSS::Channel.subscribe(url)

      expect(result).to eq(feed)
      expect(request).to have_received(:call).once
    end
  end
end
