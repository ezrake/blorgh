class CreateBlorghReports < ActiveRecord::Migration[7.0]
  def change
    create_table :blorgh_reports do |t|
      t.integer :user_id
      t.string :file_url

      t.timestamps
    end
  end
end
