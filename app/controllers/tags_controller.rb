class TagsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def show
    @tag = Tag.find(params[:id])
    @tweets = @tag.tweets.where(address: params[:address]).order(tweeted_at: :desc)
    @tweets_count = @tweets.count
  end
end
