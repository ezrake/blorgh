module Blorgh
  class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      flash[:notice] = "Comment has been created!"
      redirect_to articles_path
    end

    def show_reply
      @comment = Comment.find_by(
        article_id: params[:article_id], id: params[:id],
      )
      render "reply"
    end

    def create_reply
      @comment = Comment.new(
        text: params[:text],
        parent_id: params[:parent_id],
        article_id: params[:article_id],
      )
      if @comment.save
        redirect_to article_path(params[:article_id]), notice: "Reply was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end
