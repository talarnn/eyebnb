class AddBankDataToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :iban, :string
    add_column :profiles, :bic, :string
  end
end
