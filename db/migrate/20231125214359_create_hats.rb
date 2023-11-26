class CreateHats < ActiveRecord::Migration[7.0]
  def change
    create_table :hats do |t|
      t.string :title
      t.binary :image
      t.text :description
      t.string :category
      t.decimal :price

      t.timestamps
    end
  end
end
