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
  password: 'password'
)

user2 = User.create!(
  email:    'bob@email.com',
  password: 'password'
)

hat1 = Hat.create!(
  title:    'doberman hat',
  price: 10.99,
  description: 'hat that looks like a doberman',
  category: 'large dog'
)

hat2 = Hat.create!(
  title:    'poodle hat',
  price: 10.99,
  description: 'hat that looks like a poodle',
  category: 'small dog'
)

hat3 = Hat.create!(
  title:    'chihuahua hat',
  price: 10.99,
  description: 'hat that looks like a chihuahua',
  category: 'small dog'
)

image_path1 = Rails.root.join('db', 'images', 'placeholder.jpeg')
hat1.image.attach(io: File.open(image_path1), filename: 'placeholder.jpeg')
hat2.image.attach(io: File.open(image_path1), filename: 'placeholder.jpeg')
hat3.image.attach(io: File.open(image_path1), filename: 'placeholder.jpeg')
