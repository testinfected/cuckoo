class AddProtocolClassToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :protocol_class, :string
  end
end
