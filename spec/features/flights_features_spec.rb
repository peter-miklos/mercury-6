require 'rails_helper'

feature 'flights' do

  let!(:user1){ User.create(email: "test1@example.com", password: 123456)}
  let!(:user2){ User.create(email: "test2@example.com", password: 123456)}
  let!(:adming){ User.create(email: "admin@example.com", password: 123456, admin: true)}
  let!(:flight1){ Flight.create(number: "AA1234", capacity: 160, date: Time.new(2017, 11, 11, 12, 00))}
  let!(:flight2){ Flight.create(number: "AA2345", capacity: 240, date: Time.new(2017, 12, 12, 17, 30))}

  context 'user logged out - ' do
    context 'Show flights - ' do
      it "shows the list of available flights" do
        visit '/flights'

        expect(page).to have_content "AA1234"
        expect(page).to have_content "AA2345"
      end

      it "informs users that no flights available" do
        Flight.destroy_all
        visit '/flights'
        expect(page).to have_content("No flights available")
      end
    end

    context 'Show flight details - ' do
      
    end
  end

  context 'user logged in - ' do

  end


end
