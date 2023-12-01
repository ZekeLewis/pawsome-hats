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
user1 = User.create!(
  email:    'tara@email.com',
  password: 'password',
  isvendors: 'y'
)


doberman_hat1 = Hat.create!(
  title: 'Classic Doberman Hat',
  price: 15.99,
  description: 'Elegant Doberman hat designed for every day use',
  category: 'Doberman',
  colour: 'Brown',
  material: 'Leather'
)

doberman_hat2 = Hat.create!(
  title: 'Sporty Doberman Cap',
  price: 12.99,
  description: 'Lightweight and comfortable Doberman cap',
  category: 'Doberman',
  colour: 'Grey',
  material: 'Synthetic'
)

poodle_hat1 = Hat.create!(
  title: 'Poodle Sun Hat',
  price: 14.99,
  description: 'Stylish Poodle sun hat',
  category: 'Poodle',
  colour: 'Pink',
  material: 'Cotton'
)

poodle_hat2 = Hat.create!(
  title: 'Poodle Rain Hat',
  price: 13.99,
  description: 'Waterproof hat perfect for rainy days',
  category: 'Poodle',
  colour: 'Blue',
  material: 'Polyester'
)

chihuahua_hat1 = Hat.create!(
  title: 'Chihuahua Winter Hat',
  price: 16.99,
  description: 'Cozy winter Chihuahua hat',
  category: 'Chihuahua',
  colour: 'White',
  material: 'Wool'
)

chihuahua_hat2 = Hat.create!(
  title: 'Chihuahua Party Hat',
  price: 11.99,
  description: 'Festive Chihuahua hat for party peeps',
  category: 'Chihuahua',
  colour: 'Multi-coloured',
  material: 'Cotton'
)

image_path1 = Rails.root.join('app', 'assets', 'images', 'doberman1.webp')
image_path2 = Rails.root.join('app', 'assets', 'images', 'doberman2.webp')
image_path3 = Rails.root.join('app', 'assets', 'images', 'poodle1.webp')
image_path4 = Rails.root.join('app', 'assets', 'images', 'poodle2.webp')
image_path5 = Rails.root.join('app', 'assets', 'images', 'chihuahua1.webp')
image_path6 = Rails.root.join('app', 'assets', 'images', 'chihuahua2.webp')
doberman_hat1.image.attach(io: File.open(image_path1), filename: 'doberman1.webp')
doberman_hat2.image.attach(io: File.open(image_path2), filename: 'doberman1.webp')
poodle_hat1.image.attach(io: File.open(image_path3), filename: 'poodle1.webp')
poodle_hat2.image.attach(io: File.open(image_path4), filename: 'poodle2.webp')
chihuahua_hat1.image.attach(io: File.open(image_path5), filename: 'chihuahua1.webp')
chihuahua_hat2.image.attach(io: File.open(image_path6), filename: 'chihuahua2.webp')




