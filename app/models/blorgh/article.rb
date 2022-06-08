module Blorgh
  class Article < ApplicationRecord
    has_many :comments
    belongs_to :author, class_name: "User"
    attr_accessor :author_name

    before_validation :set_author

    enum status: {
           posted: 0,
           viewed: 1,
           overviewed: 2,
         }, _prefix: true

    private

    def set_author
      self.author = User.find_or_create_by(name: author_name)
    end
  end
end
