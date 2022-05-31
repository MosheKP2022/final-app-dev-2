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
    admin: false
    
  }
end

people << { first_name: "Moshe", last_name: "Kult Perry", admin: true }

  people.each do |person|
  first_name = person.fetch(:first_name).gsub(/\s+/, "")
  last_name = person.fetch(:last_name).gsub(/\s+/, "")

  user = User.create(

    email: "#{first_name}.#{last_name}@example.com",
    password: "password",
    first_name: first_name,
    last_name: last_name,
    phone: Faker::PhoneNumber.unique.cell_phone_in_e164,
    address: Faker::Address.street_address,
    about_me: Faker::Movie.quote,
    admin: person[:admin],
    profile_picture: "https://robohash.org/#{rand(100000000)}"
  )

  p user.errors.full_messages
end











p "There are now #{User.count} users."
end
