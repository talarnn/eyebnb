class RemoveDescriptionToPair < ActiveRecord::Migration[5.2]
  def change
    remove_column :pairs, :description
  end
end
