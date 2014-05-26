# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first) 
   

   user = User.create(email: "admin@bezlepci.cz", first_name: "admin", last_name: "bezlepci", password: "napadroku", admin: true)



   Place.create(address: "Manesova 8, Praha 2, 120 00", name: "Bezlepkova prodejna", specification: "shop", description: "Maloobchod s bezlepkovymi potravinami, otevreno denne od 8.00 do 18.00", user_id: user)
   Place.create(address: "U Zbojniku 12, Praha 10, 110 00", name: "Kavarna Marie", specification: "coffee", description: "Utulna kavarna se specializaci na bezlepkove dorty", user_id: user)
   Place.create(address: "Prava 14, Praha 4, 147 00", name: "Dolce Vita", specification: "coffee", description: "Cukrarna a kavarna s pestrou bezlepkovou nabidkou", user_id: user)
   Place.create(address: "Perglova 34, Pardubice, 286 00", name: "Bio & healthy", specification: "shop", description: "Obchod se zdravou vyzivou a bezlepkovymi produkty", user_id: user)
   Place.create(address: "U padlych hrdinu 2, Brno, 420 00", name: "Beer pub", specification: "beer", description: "Specializovana hospoda na vsechny druhy piva, dokonce i bezlepkove!", user_id: user)

