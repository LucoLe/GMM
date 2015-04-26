# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


25.times do |i|
  ClubOwner.create(
    email: "club_owner_#{i}@test.com",
    password: 123,
    password_confirmation: 123 )
end

25.times do |i|
  Club.create(
    name: "Test Club #{i}",
    country: "DE",
    city: "Stuttgart",
    address: "Address #{i}",
    postal_code: 123456,
    phone_number: "+0000000000",
    club_owner_id: (i+1) )
end

25.times do |i|
  Member.create(
    email: "member_#{i}@test.com",
    password: 123,
    password_confirmation: 123,
    first_name: "FirstName#{i}",
    last_name: "LastName" )
end

Member.all.each do |member|
  5.times do |i|
    member.subscriptions.create(
      member_id: member.id,
      club_id: i+1 )
  end
end

Member.all.each do |member|
  5.times do |i|
    member.workouts.create(
      title: "#{member.first_name} Workout #{i}",
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic quibusdam, corporis sit voluptas quidem quis delectus numquam nam blanditiis illo.",
      member_id: member.id )
  end
end

Club.all.each do |club|
  5.times do |i|
    club.workouts.create(
      title: "#{club.name} Workout #{i}",
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic quibusdam, corporis sit voluptas quidem quis delectus numquam nam blanditiis illo.",
      club_id: club.id )
  end
end