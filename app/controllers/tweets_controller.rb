class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy
  ]
  def index
    @tweets = Tweet.all
  end
  

  def destroy
    
    @tweet.destroy
    redirect_to tweets_path, notice: "つぶやきを削除しました。"
  end

  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end

  def new
    @tweets = Tweet.all
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: "新たなつぶやきが生まれました。"
    else
      render action: 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    
    if @tweet.update(tweets_params)
      redirect_to tweets_path, notice: "つぶやきに変化が起こりました。"
    else
      render action: 'edit'
    end
  end
  
  private
   def tweets_params
     params.require(:tweet).permit(:content)
   end
   
   def set_tweet
     @tweet = Tweet.find(params[:id])
   end
   
end
