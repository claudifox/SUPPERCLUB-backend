# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
  {
    first_name: 'Claudia',
    last_name: 'Fox',
    email_address: 'claudiafox95@icloud.com',
    password: 'claud1a',
    profile_picture: 'https://media.licdn.com/dms/image/C4E03AQHCw9Qjy2twpA/profile-displayphoto-shrink_200_200/0?e=1556150400&v=beta&t=yhjkf2LeRsOa1Keu-noH_-lborsqPe0AKta-lUWwLvw',
    description: "Hi there, I'm Claudia, a web developer based in South West London. Looking for interesting new people to meet and enjoy a glass of wine with over a yummy meal!"
  },
  {
    first_name: 'Kitty',
    last_name: 'Fox',
    email_address: 'kittyfox@icloud.com',
    password: 'k1tty',
    profile_picture: 'https://i.pinimg.com/280x280_RS/72/a3/51/72a3510997b041b2d01c05831e618fd2.jpg',
    description: "Hey it's Kitty here! I'm a student studying Accountancy in Newcastle. Hoping to meet some new people in my new city!"
  },
  {
    first_name: 'Issy',
    last_name: 'Fox',
    email_address: 'issyfox@icloud.com',
    password: 'i55y',
    profile_picture: 'https://scontent-lht6-1.xx.fbcdn.net/v/t31.0-8/13691108_117795928655673_6418123535609420222_o.jpg?_nc_cat=109&_nc_ht=scontent-lht6-1.xx&oh=5fa70467f0c67c1178b8ee46e9215585&oe=5D28A153',
    description: "I'm Issy, 18 and studying to become a nurse. Love Sunday Lunches and funny people!"
  },
  ])
