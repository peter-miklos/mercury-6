require 'rails_helper'

feature 'flights' do

  let!(:user1){ User.create(email: "test1@example.com", password: 123456)}
  let!(:user2){ User.create(email: "test2@example.com", password: 123456)}
  let!(:adming){ User.create(email: "admin@example.com", password: 123456, admin: true)}
  let!(:flight1){ Flight.create(number: "AA1234", capacity: 160, aircraft: "A320",
                  date: Time.new(2017, 11, 11, 12, 00), origin: "LHR", destination: "BUD")}
  let!(:flight2){ Flight.create(number: "AA2345", capacity: 240, aircraft: "A330",
                  date: Time.new(2017, 12, 12, 17, 40), origin: "LHR", destination: "JFK")}

  context 'user logged out - ' do

    context 'Add flight - ' do
      it 'does not add new flight if user logged out' do

      end

      it "does not show 'Add flight' link if logged in user is not admin" do
        sign_in

        expect(page).not_to have_content "Add flight"

      end

      xit 'does not add new flight if the logged in user is not an admin' do
        sign_in
        visit '/flights/new'

        expect(page).to have_content "You need to sign in or sign up before continuing."

      end
    end

    context 'Show flights - ' do
      it "shows the list of available flights" do
        visit '/flights'

        expect(page).to have_css("div#flight_header_0", text: "AA1234 - 2017-11-11")
        expect(page).to have_css("div#flight_content_0", text: "Origin: LHR Destination: BUD")
        expect(page).to have_css("div#flight_header_1", text: "AA2345 - 2017-12-12")
        expect(page).to have_css("div#flight_content_1", text: "Origin: LHR Destination: JFK")
      end

      it "informs users that no flights available" do
        Flight.destroy_all
        visit '/flights'
        expect(page).to have_css("div#no_flights", text: "No flights available")
      end
    end

    context 'Show flight details - ' do
      it "shows the details of a particular flight" do
        visit '/flights'
        click_link 'AA1234'

        expect(page).to have_css("div#flight_header_AA1234", text: "Flight number: AA1234 - 2017-11-11")
        expect(page).to have_css("div#flight_content_AA1234", text: "Origin: LHR Destination: BUD Aircraft: A320 Capacity: 160")
      end
    end
  end

  context 'user logged in - ' do

  end


end
