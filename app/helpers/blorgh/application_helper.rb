module Blorgh
  module ApplicationHelper
    def show_nested_comments(comment, index)
      str = formart_comment(comment, index)
      replies = comment.replies
      if !replies.empty?
        str += %Q{<div style="margin-left: 10px" >}

        replies.each_with_index do |reply, index|
          str += show_nested_comments(reply, index)
        end

        str += "</div>"
      end
      return str.html_safe
    end

    def formart_comment(comment, index)
      %Q{
        <span>#{index + 1}.</span>
        <span>#{comment.text} </span>
        #{link_to "Reply", reply_path(comment.article_id, comment)}
        <br>
      }
    end
  end
end
