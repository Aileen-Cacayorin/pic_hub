FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
    username 'fakeuser'
  end

end

# FactoryGirl.define do
#   factory :user do
#     sequence(:username) { |n| "fake#{n}" }
#     password "foobar#{n}"
#     email { "#{username}@example.com" }
#     end
#   end
