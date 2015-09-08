require 'faker'

  10.times do
    user = User.new(
      name:     Faker::Name.name,
      email:    Faker::Internet.email,
      password: Faker::Lorem.characters(8)
    )
    user.skip_confirmation!
    user.save!
  end
  users = User.all

  50.times do
    item = Item.create!(
      user:   users.sample,
      name:   Faker::Lorem.sentence
    )
    item.update_attributes(created_at: rand(10.minutes .. 1.year).ago)
  end
  items = Item.all

  member = User.new(
      name:     'Member User',
      email:    'member@example.com',
      password: 'helloworld'
    )
  member.skip_confirmation!
  member.save!

  admin = User.new(
      name:     'Big Admin',
      email:    'dpg@sfglaw.com',
      password: 'helloworld'
    )
  admin.skip_confirmation!
  admin.save!

  puts "seed finished!"
  puts "#{User.count} users created"
  puts "#{Item.count} items created"
