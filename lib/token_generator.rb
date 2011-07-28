module TokenGenerator
  def self.friendly_token
    secure_token.tr('+/=', '-_ ').strip
  end

  def self.secure_token
    ::SecureRandom.base64(16)
  end
end