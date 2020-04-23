require 'ElevatorMedia/streamer'
require 'open_weather'
require 'rest-client'
require 'spec_helper'
# require 'rails_helper'

MOCKED_RESPONSE = {"week_number"=>17,"utc_offset"=>"-04:00","utc_datetime"=>"2020-04-23T13:06:02.053002+00:00","unixtime"=>1587647162,"timezone"=>"America/Montreal","raw_offset"=>-18000,"dst_until"=>"2020-11-01T06:00:00+00:00","dst_offset"=>3600,"dst_from":"2020-03-08T07:00:00+00:00","dst"=>true,"day_of_year"=>114,"day_of_week"=>4,"datetime"=>"2020-04-23T09:06:02.053002-04:00","client_ip"=>"45.58.108.94","abbreviation"=>"EDT"}
#MOCKED_RESPONSE = {"week_number":17,"utc_offset":"-04:00","utc_datetime":"2020-04-23T13:06:02.053002+00:00","unixtime":1587647162,"timezone":"America/Montreal","raw_offset":-18000,"dst_until":"2020-11-01T06:00:00+00:00","dst_offset":3600,"dst_from":"2020-03-08T07:00:00+00:00","dst":true,"day_of_year":114,"day_of_week":4,"datetime":"2020-04-23T09:06:02.053002-04:00","client_ip":"45.58.108.94","abbreviation":"EDT"}


describe ElevatorMedia::Streamer, :type => :feature do
    
    let!(:streamer){ElevatorMedia::Streamer.new}

    # Testing if a first basic test gives back a successful response
    it "a first test to initialize environment" do
        expect(true).to be true
        
    end

    # Testing if the required getContent method returns "interesting content"
    it "should receive a response from getContent" do
        puts streamer.getContent
        expect(streamer).to respond_to(:getContent)        
    end

    # Testing the required getContent method and what it returns
    describe "getContent" do

        # Testing if the getContent method returns actual html content by expecting a String and a </div> tag
        it "should return a valid html" do    
            result = streamer.getContent()
            expect(result).to be_a(String)
            expect(result).to include('</div>')
        end

        # Testing if the getHtmlFromCloud method returns "interesting" html content described in the tests below
        it "should get interesting html content from internet" do
           expect(streamer).to receive(:getHtmlChoice)
           streamer.getContent()
        end

        # Testing if the default type of the getContent method returns 'chuck_norris' type content
        it "default content should be of 'chuck_norris' type" do
            expect(streamer).to receive(:getChuckNorrisQuote).and_return({value: {joke: 'Chuck Norris joke received'}}.to_json) 
            
            streamer.getContent('chuck_norris')
        end

        # Testing if the getContent method returns 'weather' type data if asked
        it "should be able to fetch weather data" do
            expect(streamer).to receive(:getWeather) {'<div>weather</div>'}
            streamer.getContent('weather')
        end
    end

    # Testing if the Chuck Norris database returns a succesful quote, printing a quote in the console
    it 'got response from Chuck Norris database' do
        json_response = JSON.parse(streamer.getChuckNorrisQuote)
        # puts json_response
        expect(json_response["type"]).to eq("success")
    end

    # Testing if the open-weather API gives back a response (expecting a String)
    it 'got open-weather response' do
        current_weather = streamer.getWeather['weather'][0]['main']
        expect(current_weather).to_not eq(nil)
        expect(current_weather).to be_a(String)
        #puts current_weather
    end

    # Testing if asking for a weather forecast gives back a response (expecting a String)
    it 'got open-weather forecast' do
        current_forecast = streamer.getForecast['weather'][0]['main']
        expect(current_forecast).to_not eq(nil)
        expect(current_forecast).to be_a(String)
        #puts current_forecast
    end
    
    #it "We should handle service response correctly" do
       # fake_rest_client_response = double('fake_rest_client_response')
        #json_body = double('json_body')
        #expect(RestClient).to receive(:get).with("http://worldtimeapi.org/api/timezone/America/Montreal").and_return(MOCKED_RESPONSE)
       # expect(fake_rest_client_response).to receive(:body).and_return(json_body)
       # expect(JSON).to receive(:parse).and_return(MOCKED_RESPONSE)
       # streamer.getContent()
     # end


    

    

   

end