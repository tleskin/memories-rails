20.times do
  Moment.create(
    happened_at: Faker::Time.between(4.years.ago, Time.now),
    caption: Faker::Lorem.sentence,
    content: Faker::Lorem.sentence,
    location: "#{Faker::Address.city}, #{Faker::Address.state_abbr}"
  )
end
