class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :director
      t.string :actors
      t.string :genre
      t.string :review
      t.string :quality
      t.integer :price
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
