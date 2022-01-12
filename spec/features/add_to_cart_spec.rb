require 'rails_helper'

RSpec.feature "Visitor navigates to home page and adds product to cart", type: :feature, js: true do

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
  end

  scenario "Visitor see the cart changes to 1" do

    
    visit root_path
    expect(page).to have_css 'article.product', count: 10
    expect(page).to have_content('My Cart (0)')

    click_on 'Add', match: :first

    expect(page).to have_content('My Cart (1)')


  end

end