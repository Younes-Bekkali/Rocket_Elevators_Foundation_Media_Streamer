require 'rails_helper'

RSpec.describe "AdminPanelLogIn", :type => :feature do
    context "if the email and password combination is Ok on the admin panel" do
        it " you will be redirected to the admin dashboard" do
            visit 'admin/login'
            fill_in 'Email', with: 'admin@example.com'
            fill_in 'Password', with: 'Codeboxx1!' do
            expect(page).to have_text('Dashboard')
            end
        end
    end
end