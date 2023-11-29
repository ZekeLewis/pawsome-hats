class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.string :category
      t.text :details

      t.timestamps
    end
  end
end
