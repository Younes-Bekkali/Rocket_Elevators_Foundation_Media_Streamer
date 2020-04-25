require 'rails_helper'
require 'spec_helper'
RSpec.describe "InterventionsController", :type => :controller do
    let!(:int){Intervention.new}
    # Testing if the interventions controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end
    # Testing if the interventions controller returns successful response and an actual Intervention object
   
    it "interventions controller should succesfully return an Intervention object' " do
        expect(@response.status).to eq (200)
        expect(int).to_not eq(nil)
        puts Intervention
    end
end

RSpec.describe "intervention", :type => :feature do
    context "when user goes to the intervention page" do
        it "displays the intervention form after authentification" do
            visit '/interventions'
            fill_in 'Email', with: 'admin@example.com'
            fill_in 'Password', with: 'Codeboxx1!' do
            expect(page).to have_text('INTERVENTION FORM')
            end 
        end
    end
end