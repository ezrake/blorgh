class AddParentIdToBlorghComments < ActiveRecord::Migration[7.0]
  def change
    add_column :blorgh_comments, :parent_id, :integer
  end
end
