class TweetsController < ApplicationController
  # GET /tweets
  # GET /tweets.json
  before_filter :authenticate_user!, only => [:create, :destroy]
  

#create destroy 以外のアクションは消去　routesにresousesメソッドを定義。

  def create
    @tweet = current_user.tweets.build(params[:tweet])
    if @tweet.save
      flash[:notice] = 'Tweet was successfully created.'
    else
      flash[:alert] = 'Tweet was not created.'
    end
    redirect_to root_url
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to root_url
  end
