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
  describe '.create_from_' do
    it 'should create Tweet objects from tweets' do
      tweet = Tweet.create_from(twitter_tweet)
      expect(tweet.text).to eq(twitter_tweet.text)
      expect(tweet.tweeted_at).to eq(twitter_tweet.created_at)
    end
  end
end
