class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]
	before_action :set_article

	def show
	end

	def index
		@comments = @article.comments.all
	end

	def new
		@comment = @article.comments.new
		respond_with(@article,@comment)
	end
	
	def create
		@article = @article.comments.new(comments_params)
		@article.save
		redirect_to article_path(@article)
	end

	private
		def set_comment
			@comment = Comment.find(params[:id])
		end
		

		def set_article
			@article = Article.find(params[:article_id])
		end

		

		def comments_params
     		params.require(:comment).permit(:author, :body)
    	end
end
