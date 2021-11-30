class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :game
      t.text :description
      t.integer :score
      t.string :url
      t.string :blockchain

      t.timestamps
    end
  end
end
