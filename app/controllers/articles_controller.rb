class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles
  def index
    @articles = policy_scope(Article)
    authorize @articles
  end

  # GET /articles/1
  def show
    @article = Article.find_by(id: params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
    authorize @article
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles
  def create
    @article = current_user.articles.new(article_params)
    authorize @article

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /articles/1
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully deleted' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body, :user_id)
  end
end
