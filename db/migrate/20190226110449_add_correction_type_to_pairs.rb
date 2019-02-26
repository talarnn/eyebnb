class AddCorrectionTypeToPairs < ActiveRecord::Migration[5.2]
  def change
    add_column :pairs, :correction_type, :string
  end
end
