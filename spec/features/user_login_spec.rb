require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @user = User.create!(name: "Jay", email: "chunsaa@gmail.com", password: "123", password_confirmation: "123")

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

  scenario "They see all products and click login" do
    expect(has_content?('Login')).to be true
    save_screenshot("before-login.png")
    click_on 'Login'    
    expect(has_content?('Password:')).to be true
    save_screenshot("login-page.png")
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    save_screenshot("login-page-with-form-filled.png")
    click_on 'Submit'
    expect(page).to have_css 'article.product'
    expect(has_content?('Signed in as')).to be true
    save_screenshot("after-login-click.png")    
  end

end
