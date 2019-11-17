class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  private
  def video_params
    params.require(:tweet).permit(:title, :image, :text, :link,)
  end
  
end

