class AddViewCountToBlorghArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :blorgh_articles, :view_count, :integer
  end
end
