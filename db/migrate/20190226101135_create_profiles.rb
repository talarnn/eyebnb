class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :tel
      t.references :user

      t.timestamps
    end
  end
end
