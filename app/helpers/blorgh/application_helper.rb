module Blorgh
  module ApplicationHelper
    def show_nested_comments(comment)
      replies = comment.replies
      if replies.empty?
        return
      else
        render partial: "blorgh/comments/replies", collection: replies, as: "comment"
      end
    end
  end
end
