require 'csv'

# CSV.foreach(Rails.root.join('lib/seed_csv/users_seed.csv'), headers: true) do |row|
#   User.create(
#     {
#       name: row["name"],
#       age: row["age"],
#       email: row["email"],
#       phone: row["phone"]
#     } 
#   )
# end

CSV.foreach(Rails.root.join('lib/seed_csv/clients_seed.csv'), headers: true) do |row|
  User.create(
    {
      name: row["name"],
      age: row["address"],
      email: row["email"],
      phone: row["phone"]
    } 
  )
end