require 'rails_helper'


feature "user can search for tribe members" do

  scenario "user submits tribe name" do

    visit '/'

    select "Fire Nation", from: :search

    click_on "Search for Members"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("20 results")
    expect(page).to have_css(".member", count: 20)

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".allies")
      expect(page).to have_css(".enemies")
      expect(page).to have_css(".affiliation")
    end


  end
end
