class AddAasmToDonation < ActiveRecord::Migration[7.2]
  def change
    add_column :donations, :aasm_state, :string
    # timestamps
    add_column :donations, :confirmed_at, :datetime
    add_column :donations, :failed_at, :datetime
    add_column :donations, :revoked_at, :datetime
  end
end
