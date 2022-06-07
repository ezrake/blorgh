module Blorgh
  class Comment < ApplicationRecord
    has_many :replies, class_name: "Comment",
                       foreign_key: "parent_id"

    belongs_to :parent, class_name: "Comment", optional: true
    scope :root, -> { where("parent_id is null") }
  end
end
