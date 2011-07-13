class AddValueToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :value, :string
  end
end
