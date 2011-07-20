class Vote < ActiveRecord::Base
  belongs_to :proposal

  scope :cast_as, lambda { |choice| where(:value => choice.to_s) }

  def choice
    value.intern
  end
end
