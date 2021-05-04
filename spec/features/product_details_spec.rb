require 'rails_helper'

RSpec.feature "Visiting Product Details Page", type: :feature, js: true do
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
  
    scenario "click on product, and visit product page" do
    
      click_on("Details", match: :first)
      
      # VERIFY
      expect(page).to have_css "section.products-show"
  
      save_screenshot 'click_on_product.png'
    end
  
end
