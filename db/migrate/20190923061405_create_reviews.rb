class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :review
      t.integer :ratings
      t.integer :user_id
      t.integer :restaurent_id

      t.timestamps null: false
    end
  end
end
