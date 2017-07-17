# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  text       :string
#  tweeted_at :datetime
#  metadata   :jsonb
#  address    :string
#  lat        :string
#  long       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:file) { File.expand_path('../../fixtures/tweet.yml', __FILE__) }
  let(:twitter_tweet) { YAML.load(File.read(file)) }
 
  let(:file2) { File.expand_path('../../fixtures/tweet.only_geo_no_place.yml', __FILE__) }
  let(:twitter_tweet_only_geo) { YAML.load(File.read(file2)) }
 
  let(:file3) { File.expand_path('../../fixtures/tweet.only_place_no_geo.yml', __FILE__) }
  let(:twitter_tweet_only_place) { YAML.load(File.read(file3)) }
 
  let(:file4) { File.expand_path('../../fixtures/tweet.only_user_address.yml', __FILE__) }
  let(:twitter_tweet_only_user) { YAML.load(File.read(file4)) }
 
  describe '.create_from_' do
    it 'should create Tweet objects from tweets' do
      tweet = Tweet.create_from(twitter_tweet)
      expect(tweet.text).to       eq(twitter_tweet.text)
      expect(tweet.tweeted_at).to eq(twitter_tweet.created_at)
    end

    it 'should generate Address from lat-long in tweet' do
      tweet = Tweet.create_from(twitter_tweet_only_geo)
      expect(tweet.address).to eq('278 Broadway, New York, NY 10007, USA')
    end

    it 'should generate lat-long from address in place of the tweet' do
      tweet = Tweet.create_from(twitter_tweet_only_place)
      expect(tweet.lat).to  eq('41.6032207')
      expect(tweet.long).to eq('-73.087749')
    end

    it 'should generate lat-long from address of the user of the tweet' do
      tweet = Tweet.create_from(twitter_tweet_only_user)
      # binding.pry
      expect(tweet.lat).to  eq('40.7127837')
      expect(tweet.long).to eq('-74.0059413')
    end
  end
end
