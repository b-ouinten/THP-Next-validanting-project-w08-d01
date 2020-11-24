# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Rails.application.eager_load!
# ApplicationRecord.descendants.each { |model|
#   unless model == User
#     model.delete_all
#     ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
#     puts "The table #{model.table_name} was deleted !"
#   end
# }

user = User.create(email: 'bouinten@yahoo.fr', password:'wazo6556')

30.times do 
  Article.create(
    title: Faker::Movie.title, 
    content: Faker::Movie.quote,
    user: user
  )
end

puts 'The database was filled by some articles using Faker gem !'
