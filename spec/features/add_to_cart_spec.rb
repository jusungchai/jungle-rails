require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    visit root_path
  end

  scenario "They see all products and click first item details" do
    expect(has_content?('My Cart (0)')).to be true
    save_screenshot("before-add-cart.png")
    find('button.btn', match: :first).click
    expect(has_content?('My Cart (1)')).to be true
    save_screenshot("after-add-cart.png")
  end

end
