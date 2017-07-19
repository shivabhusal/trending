class DashboardsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def show
    tweets        = Tweet.includes(:tag).where.not(address: nil).distinct
    @tweets_count = tweets.count
    @data         = tweets.group_by(&:address).map {|x,y| [x, y.group_by(&:tag).map{|x,y| [x.id, x.name, y.count]}]}
    @data         = Kaminari.paginate_array(@data).page(params[:page])
    @chart_data   = Tweet.group('date(tweeted_at)').group(:tag_id).count.group_by {|x,y| x[0]}
  end
end
