class ChangeCorretionTypeToBeFloatInPairs < ActiveRecord::Migration[5.2]
  def change
    change_column :pairs, :right_eye_correction, :float
    change_column :pairs, :left_eye_correction, :float
  end
end
