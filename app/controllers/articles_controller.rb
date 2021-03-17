class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :search_category_article, only: [:index, :category, :hashtag, :search]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
    redirect_to article_path(@article), notice: '投稿に成功しました。'
    else
      render :new
    end  
  end

  def edit
    @article = Article.find(params[:id])
    if @article.user != current_user
      redirect_to articles_path, alert: '不正なアクセスです。'
    end  
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
    redirect_to article_path(@article), notice: '更新に成功しました。'
    else
      render :edit
    end  
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end
  
  def category
    @articles = @q.result
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image, :category_id)
  end

  def search_category_article
    @q = Article.ransack(params[:q])
  end

end
