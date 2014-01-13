class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to tweet_show_path(@tweet.id)
    else
      render 'new'
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body, :author)
  end
end
