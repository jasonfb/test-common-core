FactoryBot.define do
  factory :thing do
    user { create(:user) }
  end
end