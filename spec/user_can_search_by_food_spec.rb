# As a user, XX
# When I visit "/" XXX
# And I fill in the search form with "sweet potatoes"XXX
# (Note: Use the existing search form)XX
# And I click "Search" XX
# Then I should be on page "/foods"xX
# Then I should see a total of the number of items returned by the search. 
# Then I should see a list of ten foods that contain the ingredient "sweet potatoes"
# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients
require 'rails_helper'

feature "User can search for foods " do 
    scenario 'user fills in valid food in search form' do 
    visit '/'

    fill_in :q, with: "sweet potatoes"
        
    click_on "Search"
    expect(current_path).to eq("/foods")
    # Then my path should be "/search" with "state=CO" in the parameters
    expect(page).to have_content("7 Results")
    # And I should see a message "7 Results"
    expect(page).to have_css(".member", count: 7)
    # And I should see a list of 7 the members of the house for Colorado

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
    end
    # And they should be ordered by seniority from most to least
    # And I should see a name, role, party, and district for each member

  end
end