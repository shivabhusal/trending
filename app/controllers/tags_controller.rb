class TagsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def show
    @tag = Tag.find(params[:id])
    @tweets = @tag.tweets.from_(params[:address])
    @tweets_count = @tweets.count
  end
end
