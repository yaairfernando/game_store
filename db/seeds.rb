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

# CSV.foreach(Rails.root.join('lib/seed_csv/clients_seed.csv'), headers: true) do |row|
#   Client.create(
#     {
#       name: row["name"],
#       address: row["address"],
#       email: row["email"],
#       phone: row["phone"]
#     } 
#   )
# end

# CSV.foreach(Rails.root.join('lib/seed_csv/games_seed.csv'), headers: true) do |row|
#   Game.create(
#     {
#       name: row["name"],
#       price: row["price"],
#       uid: row["uid"]
#     } 
#   )
# end


# CSV.foreach(Rails.root.join('lib/seed_csv/sale_types_seed.csv'), headers: true) do |row|
#   SaleType.create(
#     {
#       name: row["name"],
#       code: row["code"],
#       category: row["category"]
#     } 
#   )
# end

# CSV.foreach(Rails.root.join('lib/seed_csv/sales_seed.csv'), headers: true) do |row|
#   Sale.create(
#     {
#       seller_id: row["seller_id"],
#       buyer_id: row["buyer_id"],
#       total: row["total"],
#       status: row["status"],
#       uid: SecureRandom.uuid,
#       sale_type_id: row["sale_type_id"]
#     } 
#   )
# end

CSV.foreach(Rails.root.join('lib/seed_csv/sale_details_seed.csv'), headers: true) do |row|
  SaleDetail.create(
    {
      currency: row["currency"],
      country: row["country"],
      state: row["state"],
      sale_id: row["sale_id"]
    } 
  )
end