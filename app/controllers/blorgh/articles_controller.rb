module Blorgh
  class ArticlesController < ApplicationController
    before_action :set_article, only: %i[ show edit update destroy ]
    after_action :generate_csv, only: [:create]

    # GET /articles
    def index
      @articles = Article.all
    end

    # GET /articles/1
    def show
      @article.increment(:view_count)
      if @article.view_count > 10
        @article.status_overviewed!
      else
        @article.status_viewed!
      end
    end

    # GET /articles/new
    def new
      @article = Article.new
    end

    # GET /articles/1/edit
    def edit
    end

    # POST /articles
    def create
      @article = Article.new(article_params)
      @article.status_posted!

      if @article.save
        redirect_to @article, notice: "Article was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /articles/1
    def update
      if @article.update(article_params)
        redirect_to @article, notice: "Article was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /articles/1
    def destroy
      @article.destroy
      redirect_to articles_url, notice: "Article was successfully destroyed."
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def generate_csv
      user = main_app.scope.current_user
      Blorgh::CreateReportsJob.perform_now(user)
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :text, :author_name)
    end
  end
end
