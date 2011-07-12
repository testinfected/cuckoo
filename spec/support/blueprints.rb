require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Proposal.blueprint do
  subject { Faker::Lorem.sentence}
  wording { Faker::Lorem.paragraph }
end
