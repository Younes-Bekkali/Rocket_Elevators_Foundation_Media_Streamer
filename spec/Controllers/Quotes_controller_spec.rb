require 'rails_helper'
require 'spec_helper'

RSpec.describe "QuotesController", :type => :controller do
    let!(:quot){Quote.new}
    # Testing if the Quotes controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end
    # Testing if the quotes controller returns successful response and an actual Quote object
    # (uncomment the 'p Quote line' to see it in the console)
    it "Quotess controller should succesfully return an Lead object' " do
        expect(@response.status).to eq (200)
        expect(quot).to_not eq(nil)
        #p Quote
    end
end