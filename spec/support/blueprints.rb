Proposal.blueprint do
  subject { Faker::Lorem.sentence}
  wording { Faker::Lorem.paragraph }
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
