# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

title = Title.create(name: "Wimbledon", title_type: 'major', year: 2017)
player = Player.new(name: "Roger Federer", age: 36.25, titles: [title], prize_money: 110235682, grand_slams: 19)
player.save
