require 'token_generator'

class GuestPass < ActiveRecord::Base
  before_create :generate_token

  belongs_to :proposal

  private
  def generate_token
    self.token = TokenGenerator.friendly_token
  end
end
