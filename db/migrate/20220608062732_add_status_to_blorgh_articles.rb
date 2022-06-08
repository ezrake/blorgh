class AddStatusToBlorghArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :blorgh_articles, :status, :integer
  end
end
