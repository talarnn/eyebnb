class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :status
      t.date :beginning_date
      t.date :end_date
      t.references :pair, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
