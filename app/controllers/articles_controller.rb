class ArticlesController < ApplicationController
	def show
		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		puts "-"*20
		puts params
		puts "-"*20
		@article = Article.new(params.require(:article).permit(:title, :description));
		if @article.save
			flash[:notice] = "Article created successully"
			redirect_to article_path(@article)
		else
			puts "*"*20
			puts @article.errors.full_messages
			puts "*"*20
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(params.require(:article).permit(:title, :description))
			flash[:notice] = "Article updated successully"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end
end