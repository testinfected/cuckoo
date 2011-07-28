class CreateGuestPasses < ActiveRecord::Migration
  def change
    create_table :guest_passes do |t|
      t.string :token
      t.references :proposal

      t.timestamps
    end
  end
end
