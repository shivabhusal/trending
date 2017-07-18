# Fetches tweets since yesterday and loads to the database
#
# I, [2017-07-18T09:28:34.524929 #18667]  INFO -- : Fetching tweets for Nepal
# I, [2017-07-18T09:28:35.591348 #18667]  INFO -- : Tweets count for Nepal: 64
# 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
#
# Note: This process is slow, because it fetches GeoCoding info from the internet
namespace :trending do
  desc 'fetch tweets containing #hashtags every 12 hrs'
  task fetch: :environment do
    log_file = ENV['log'] == 'stdout' ? STDOUT : Rails.root.join('log/cron.log')

    logger = Logger.new(log_file)

    tags = Tag.all
    tags.each do |tag|
      logger.info "Fetching tweets for #{tag.name}"

      tweets = TwitterClient.search("##{tag.name} since:#{Date.today - 1.day}")

      logger.info "Tweets count for #{tag.name}: #{tweets.count}"
      log = ''

      tweets.each.with_index do |tweet, index|
        Tweet.create_from(tweet, tag)

        log << "#{index}, "
      end
      logger.info log
    end
  end
end
