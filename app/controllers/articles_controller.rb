class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.find(params[:id])
    @article.save
    redirect_to article_path(@article) 
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
  end

  private 

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
