class CreatePairs < ActiveRecord::Migration[5.2]
  def change
    create_table :pairs do |t|
      t.string :title
      t.string :brand
      t.text :description
      t.string :picture
      t.integer :right_eye_correction
      t.integer :left_eye_correction
      t.integer :price
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
