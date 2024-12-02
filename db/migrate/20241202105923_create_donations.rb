class CreateDonations < ActiveRecord::Migration[7.2]
  def change
    create_table :donations do |t|
      t.belongs_to :receiver, foreign_key: true
      t.integer :amount_in_cents

      t.timestamps
    end
  end
end
