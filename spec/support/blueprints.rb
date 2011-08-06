Proposal.blueprint do
  subject { Faker::Lorem.sentence }
  wording { Faker::Lorem.paragraph }
  protocol_class { %w[Unanimity Majority].sample }
end

Vote.blueprint do
  value { Faker::Lorem.words(1) }
end

Vote.blueprint(:yes) do
  value { "yes" }
end

Vote.blueprint(:no) do
  value { "no" }
end

GuestPass.blueprint do
  token { TokenGenerator.friendly_token }
end
