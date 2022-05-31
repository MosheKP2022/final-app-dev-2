task sample_data: :environment  do
  p "Creating sample data"



if Rails.env.development?
ContactUsMessage.delete_all
Comment.delete_all
FamilyMember.delete_all
Tag.delete_all
Save.delete_all
# LabeledOffering.delete_all
Kid.delete_all
Offering.delete_all
User.delete_all
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

Children = Array.new(20) do
  {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.unique.last_name,
    dob: Faker::Date.between(from: '2017-05-31', to: '2022-05-31'),
    school: Faker::University.name
  }
end

Children << { first_name: "Shalev", last_name: "Kult Perry", dob: '2020-04-29' }

  Children.each do |child|
    first_name = child.fetch(:first_name).gsub(/\s+/, "")
    last_name = child.fetch(:last_name).gsub(/\s+/, "")

  kid = Kid.create(

    first_name: first_name,
    last_name: last_name,
    dob: child[:dob],
    school: child[:school]
  )

  p kid.errors.full_messages
end

  users = User.all 
  
 
  kids = Kid.all
  kids.each do |kid|
  sample_users = users.sample
  sample_users.children << kid
  end

  users.each do |user|
  
  rand(5).times do
    min_age = rand(0..3.5).round(2)
    max_age = min_age + rand(0.1..5.5).round(2)
    offering = user.own_offerings.create(
      title: Faker::Games::Pokemon.name,
      description:Faker::Games::Pokemon.move,
      image: "https://robohash.org/#{rand(100000000)}",
      min_age: min_age,
      max_age: max_age,
      address: Faker::Address.street_address,
      price: rand(1.1..10.1).round(2),
      status: Offering.statuses.keys.sample

    )
      
    p offering.errors.full_messages

    if rand < 0.45
      comment = offering.comments.create(
        body: Faker::Quote.jack_handey,
        commenter: user,
        private: [true, false].sample
      )

      p comment.errors.full_messages
    end
      if rand < 0.25
        contact_us_message = user.contact_us_messages.create(
          title:Faker::Movies::HarryPotter.spell, 
          body: Faker::Quote.jack_handey,
          user: user
        )
  
        p contact_us_message.errors.full_messages
      end
          if rand < 0.5
            offering.cold_leads << user
          end 
    end
  end

    lables = Array.new
    
    lables << {name: "Books"}
    lables << {name: "Clothes"}
    lables << {name: "Cars"}
    lables << {name: "Building Blocks"}
    lables << {name: "Dolls"}
     
    p lables 
    lables.each do |lable|
      tag = Tag.create(
         name: lable[:name]
      )
    
      p tag.errors.full_messages
    
    end











p "There are now #{User.count} users."
p "There are now #{Kid.count} kids."
p "There are now #{Offering.count} offerings."
p "There are now #{Comment.count} comments."
p "There are now #{ContactUsMessage.count} contact_us_messages."
p "There are now #{FamilyMember.count} family members."
p "There are now #{Save.count} saves."
p "There are now #{Tag.count} tags."
end
