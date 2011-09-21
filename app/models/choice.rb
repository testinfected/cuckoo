class Choice < ActiveRecord::Base
  belongs_to :proposal
  
  def to_s
    label
  end
end
