class ChoicesBelongsToProposal < ActiveRecord::Migration
  def change
    change_table(:choices) do |t|
      t.belongs_to(:proposal)
    end
  end
end
