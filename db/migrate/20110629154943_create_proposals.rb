class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.text :wording

      t.timestamps
    end
  end
end
