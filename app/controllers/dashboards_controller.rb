class DashboardsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def show
    tweets        = Tweet.includes(:tag).where.not(address: nil).distinct
    @tweets_count = tweets.count
    @data         = pagination_for(tweets)
    @chart_data   = Tweet.group('date(tweeted_at)').group(:tag_id)
                         .count
                         .group_by { |array_of_date, _| array_of_date[0] }
  end

  private

  def pagination_for(tweets)
    Kaminari.paginate_array(data_for_panels_from(tweets)).page(params[:page])
  end

  def data_for_panels_from(all_tweets)
    # Will give data formatted like
    # [1, 'Nepal', 12]
    format = ->(tag, tweets) { [tag.id, tag.name, tweets.count] }

    all_tweets.group_by(&:address)
              .map do |address, tweets|
                [address, tweets.group_by(&:tag).map(&format)]
              end
  end
end
