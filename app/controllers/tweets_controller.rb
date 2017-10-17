class TweetsController < ApplicationController
	def index
		@tweets = Tweet.all
	end
	def show
		@tweet = Tweet.find(params[:id])
	end
	def new
		@tweet = Tweet.new()
	end
	def create
		@tweet = Tweet.new(post_params)
		if @tweet.save
			redirect_to @tweet
		else
			render :new
		end
	end

	private
	
	def post_params
		params.require(:tweet).permit(:title, :summary, :body)
	end
end
