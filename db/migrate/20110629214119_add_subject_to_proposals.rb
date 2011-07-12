class AddSubjectToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :subject, :string
  end
end
