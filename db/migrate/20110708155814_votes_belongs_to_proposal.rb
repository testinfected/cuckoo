class VotesBelongsToProposal < ActiveRecord::Migration
  def change
    change_table(:votes) do |t|
      t.belongs_to(:proposal)
    end
  end
end
