# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
# unless Rails.env.development?
#   puts "Development seeds only (for now)!"
#   exit 0
# end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699825/lit-jungle/apparel1_tgqnkv.jpg"),
  quantity: 10,
  price: 64.99
})

# cat1.products.create!({
#   name:  'Women\'s Zebra pants',
#   description: Faker::Hipster.paragraph(4),
#   image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699825/lit-jungle/apparel1_tgqnkv.jpg"),
#   quantity: 18,
#   price: 64.99
# })

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699825/lit-jungle/apparel3_qcrmyo.jpg"),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699825/lit-jungle/apparel4_sfmne4.jpg"),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699824/lit-jungle/apparel5_zoqb2l.jpg"),
  quantity: 0,
  price: 1_225.00
})

# cat1.products.create!({
#   name:  'Human Feet Shoes',
#   description: Faker::Hipster.paragraph(4),
#   image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699825/lit-jungle/apparel1_tgqnkv.jpg"),
#   quantity: 82,
#   price: 224.50
# })

cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699825/lit-jungle/electronics1_ows671.jpg"),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699825/lit-jungle/electronics2_n0xsih.jpg"),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699824/lit-jungle/electronics3_yf3uwd.jpg"),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699824/lit-jungle/furniture1_yzxbox.jpg"),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699824/lit-jungle/furniture2_hj57x1.jpg"),
  quantity: 0,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open("https://res.cloudinary.com/dmkdmvbe9/image/upload/v1576699824/lit-jungle/furniture3_ks0gzp.jpg"),
  quantity: 0,
  price: 2_483.75
})


puts "DONE!"
