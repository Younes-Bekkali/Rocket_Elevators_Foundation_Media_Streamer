require 'rails_helper'
require 'spec_helper'

RSpec.describe "QuotesController", :type => :controller do
    let!(:quot){Quote.new}
    # Testing if the Quotes controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end
    # Testing if the quotes controller returns successful response and an actual Quote object
  
    it "Quotes controller should succesfully return an Lead object' " do
        expect(@response.status).to eq (200)
        expect(quot).to_not eq(nil)
        puts Quote
    end
end

RSpec.describe "quote", :type => :feature do
    context "when the user goes to the quote page" do
        it "displays the quote form" do
           visit '/quoteform'

            expect(page).to have_text('Request Form:')
        end
    end
end
