require 'rails_helper'
require 'spec_helper'

RSpec.describe "LeadsController", :type => :controller do
    let!(:led){Lead.new}
    # Testing if the Leads controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end
    # Testing if the leads controller returns successful response and an actual Lead object
    
    it "Leads controller should succesfully return an Lead object' " do
        expect(@response.status).to eq (200)
        expect(led).to_not eq(nil)
        puts Lead
    end
end