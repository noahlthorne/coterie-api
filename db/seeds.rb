require 'faker'

User.destroy_all
Organization.destroy_all
Volunteer.destroy_all

# create admins
number_of_users = 0
ActiveRecord::Base.transaction do
  20.times do
    number_of_users += 1
    first_name = Faker::Name.name.split(' ')[0]
    last_name = Faker::Name.name.split(' ')[1]
    user = User.new(first_name: first_name, last_name: last_name, email: Faker::Internet.email, admin: true)
    password = (0...8).map { (65 + rand(26)).chr }.join
    user.password = password
    user.save!
    p "#{number_of_users} users saved"
  end

  # create normal users
  200.times do
    number_of_users += 1
    first_name = Faker::Name.name.split(' ')[0]
    last_name = Faker::Name.name.split(' ')[1]
    user = User.new(first_name: first_name, last_name: last_name, email: Faker::Internet.email, admin: false)
    password = (0...8).map { (65 + rand(26)).chr }.join
    user.password = password
    user.save!
    p "#{number_of_users} users saved"
  end

  # create organizations
  20.times do
    organization = Organization.new(name: Faker::Company.name)
    organization.save!
  end

  # create volunteers
  User.all.each do |user|
    volunteer = Volunteer.new
    volunteer.user = user
    volunteer.organization = Organization.all.sample(rand(1..3)).first
    volunteer.save!
  end
end