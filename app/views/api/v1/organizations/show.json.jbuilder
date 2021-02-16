json.extract! @organization, :id, :name
json.volunteers @organization.volunteers do |volunteer|
  json.extract! volunteer, :id
  json.user do
    json.id volunteer.user.id
    json.first_name volunteer.user.first_name
    json.last_name volunteer.user.last_name
    json.email volunteer.user.email
    json.admin volunteer.user.admin
  end
end