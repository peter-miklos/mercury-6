require 'rails_helper'

feature 'flights' do

  context 'No flights exist' do
    it "informs users that no flights available" do
      visit '/flights'
      expect(page).to have_content("No flights available")
    end
  end

  context 'Flights exist' do
    
  end
end
