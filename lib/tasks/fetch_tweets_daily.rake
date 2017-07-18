# Fetches tweets since yesterday and loads to the database
#
# I, [2017-07-18T09:28:34.524929 #18667]  INFO -- : Fetching tweets for Nepal
# I, [2017-07-18T09:28:35.591348 #18667]  INFO -- : Tweets count for Nepal: 64
# 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
namespace :trending do
  desc 'fetch tweets containing #hashtags every 12 hrs'
  task fetch: :environment do
    # binding.pry
    logger = Logger.new(STDOUT)

    tags = %w[Nepal Kathmandu]
    tags.each do |tag|
      logger.info "Fetching tweets for #{tag}"
      tweets = TwitterClient.search("##{tag} since:#{Date.today - 1.day}")
      logger.info "Tweets count for #{tag}: #{tweets.count}"
      tweets.each.with_index do |tweet, index|
        Tweet.create_from(tweet)
        print "#{index}, "
      end
    end
  end
end
