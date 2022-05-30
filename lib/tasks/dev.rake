task sample_data: :environment  do
  p "Creating sample data"



if Rails.env.development?
# ContactUsMessage.delete_all
# Comment.delete_all
# FamilyMembers.delete_all
# Tag.delete_all
# Save.delete_all
# LabeledOffering.delete_all
# Kid.delete_all
User.delete_all
# Offering.delete_all
end

people = Array.new(10) do
  {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.unique.last_name,
    admin: [false]
    
  }
end

people << { first_name: "Moshe", last_name: "KultPerry", admin: true }
# people << { first_name: "Bob", last_name: "Smith" }
# people << { first_name: "Carol", last_name: "Smith" }
# people << { first_name: "Doug", last_name: "Smith" }

people.each do |person|
  # first_name = person.fetch(:first_name)
  # last_name = person.fetch(:last_name)

  user = User.create(

    email: "#{person[:first_name]}.#{person[:last_name]}@example.com",
    password: "password",
    first_name: person[:first_name],
    last_name: person[:first_name],
    phone: 10.times.map{rand(10)}.join.to_i,
    address: Faker::Address.street_address,
    about_me: Faker::Movie.quote,
    admin: person[:admin],
    profile_picture: "https://robohash.org/#{rand(100000000)}"
  )

  p user.errors.full_messages
end











p "There are now #{User.count} users."
end
