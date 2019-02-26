class AddProfilePicToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :profile_pic, :string
  end
end
