# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users

user1 = User.create!(
  email:    'alice@email.com',
  password: 'password',
  isvendors: 'n'
)

user2 = User.create!(
  email:    'bob@email.com',
  password: 'password',
  isvendors: 'n'
)
user3 = User.create!(
  email:    'tara@email.com',
  password: 'password',
  isvendors: 'y'
)

doberman_hat1 = Hat.create!(
  title: 'Classic Doberman Hat',
  price: 15.99,
  description: 'Elegant Doberman hat designed for every day use',
  category: 'Doberman',
  colour: 'Black',
  material: 'cotton',
  quantity: 3,
  fit: 'Woman'
)

doberman_hat2 = Hat.create!(
  title: 'Sporty Doberman Cap',
  price: 12.99,
  description: 'Lightweight and comfortable Doberman cap',
  category: 'Doberman',
  colour: 'Brown',
  material: 'Cotton',
  quantity: 11,
  fit: 'Woman'
)
doberman_hat3 = Hat.create!(
  title: 'Doberman Themed Hat',
  price: 15.99,
  description: 'Doberman Themed Hat for doberman',
  category: 'Doberman',
  colour: 'Brown',
  material: 'Leather',
  quantity: 5,
  fit: 'Dog'
)

doberman_hat4 = Hat.create!(
  title: 'Rainy Day Doberman Cap',
  price: 12.99,
  description: 'Lightweight and comfortable Doberman cap for Doberman lovers',
  category: 'Doberman',
  colour: 'Brown',
  material: 'Polyester',
  quantity: 11,
  fit: 'Men'
)


poodle_hat1 = Hat.create!(
  title: 'Poodle Sun Hat',
  price: 14.99,
  description: 'Stylish Poodle sun hat',
  category: 'Poodle',
  colour: 'Pink',
  material: 'Cotton',
  quantity: 11,
  fit: 'Woman'
)

poodle_hat2 = Hat.create!(
  title: 'Poodle Rain Hat',
  price: 13.99,
  description: 'Waterproof hat perfect for rainy days',
  category: 'Poodle',
  colour: 'Black',
  material: 'Polyester',
  quantity: 11,
  fit: 'Men'
)
poodle_hat3 = Hat.create!(
  title: 'Poodle Themed Hat',
  price: 14.99,
  description: 'Stylish poodle themed sun hat for poodles',
  category: 'Poodle',
  colour: 'Grey',
  material: 'Cotton',
  quantity: 11,
  fit: 'Dog'
)

poodle_hat4 = Hat.create!(
  title: 'Poodle Winter Hat',
  price: 13.99,
  description: 'Poodle hat perfect for winter days',
  category: 'Poodle',
  colour: 'Blue',
  material: 'Polyester',
  quantity: 11,
  fit: 'Woman'
)

chihuahua_hat1 = Hat.create!(
  title: 'Chihuahua Party Hat',
  price: 16.99,
  description: 'Cozy party Chihuahua hat',
  category: 'Chihuahua',
  colour: 'Blue',
  material: 'Wool',
  quantity: 11,
  fit: 'Men'
)

chihuahua_hat2 = Hat.create!(
  title: 'Chihuahua Party Hat',
  price: 11.99,
  description: 'Festive Chihuahua hat for party peeps',
  category: 'Chihuahua',
  colour: 'Pink',
  material: 'Cotton',
  quantity: 11,
  fit: 'Men'
)
chihuahua_hat3 = Hat.create!(
  title: 'Chihuahua Themed Hat',
  price: 16.99,
  description: 'Cozy winter Chihuahua themed hat for chihuahua dogs',
  category: 'Chihuahua',
  colour: 'Grey',
  material: 'Wool',
  quantity: 11,
  fit: 'Dog'
)

chihuahua_hat4 = Hat.create!(
  title: 'Chihuahua Baseball Hat',
  price: 11.99,
  description: 'Causual Chihuahua hat for everyday use',
  category: 'Chihuahua',
  colour: 'Grey',
  material: 'Cotton',
  quantity: 11,
  fit: 'Woman'
)

image_path1 = Rails.root.join('app', 'assets', 'images', 'doberman1.webp')
image_path2 = Rails.root.join('app', 'assets', 'images', 'doberman2.webp')
image_path3 = Rails.root.join('app', 'assets', 'images', 'Doberman3.webp')
image_path4 = Rails.root.join('app', 'assets', 'images', 'Doberman4.webp')
image_path5 = Rails.root.join('app', 'assets', 'images', 'poodle1.webp')
image_path6 = Rails.root.join('app', 'assets', 'images', 'poodle2.webp')
image_path7 = Rails.root.join('app', 'assets', 'images', 'poodle3.webp')
image_path8 = Rails.root.join('app', 'assets', 'images', 'poodle4.webp')
image_path9 = Rails.root.join('app', 'assets', 'images', 'chihuahua1.webp')
image_path10 = Rails.root.join('app', 'assets', 'images', 'chihuahua2.webp')
image_path11 = Rails.root.join('app', 'assets', 'images', 'chihuahua3.webp')
image_path12 = Rails.root.join('app', 'assets', 'images', 'chihuahua4.webp')
doberman_hat1.image.attach(io: File.open(image_path1), filename: 'doberman1.webp')
doberman_hat2.image.attach(io: File.open(image_path2), filename: 'doberman1.webp')
doberman_hat3.image.attach(io: File.open(image_path3), filename: 'Doberman3.webp')
doberman_hat4.image.attach(io: File.open(image_path4), filename: 'Doberman4.webp')
poodle_hat1.image.attach(io: File.open(image_path5), filename: 'poodle1.webp')
poodle_hat2.image.attach(io: File.open(image_path6), filename: 'poodle2.webp')
poodle_hat3.image.attach(io: File.open(image_path7), filename: 'poodle3.webp')
poodle_hat4.image.attach(io: File.open(image_path8), filename: 'poodle4.webp')
chihuahua_hat1.image.attach(io: File.open(image_path9), filename: 'chihuahua1.webp')
chihuahua_hat2.image.attach(io: File.open(image_path10), filename: 'chihuahua2.webp')
chihuahua_hat3.image.attach(io: File.open(image_path11), filename: 'chihuahua3.webp')
chihuahua_hat4.image.attach(io: File.open(image_path12), filename: 'chihuahua4.webp')




