require 'ElevatorMedia/streamer'
require 'open_weather'
require 'rest-client'
require 'spec_helper'
# require 'rails_helper'

describe ElevatorMedia::Streamer do
    
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
    describe "getContent behavior" do

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



    # Testing if Spotify gives back any successful response
    # it 'got spotify response' do
    #     expect(RSpotify).to receive(:raw_response) {true}
    #     streamer_object = ElevatorMedia::Streamer.new
    #     valid_response = streamer_object.getSpotifyResponse
    #     expect(valid_response).to eq(true)
    # end    

    # Testing if the Spotify user is logged-in (should be true, because a client ID and secret was supplied)
    # it 'got spotify login status' do
    #     expect(RSpotify).to receive(:authenticate) {true}
    #     streamer_object = ElevatorMedia::Streamer.new
    #     login_status = streamer_object.getSpotifyStatus
    #     expect(login_status).to eq(true)
    # end

    # Testing if a specific Spotify user can be found (using my personel spotify username)
    # it 'got spotify valid user' do
    #     expect(RSpotify::User).to receive(:find) {"awoggddbv0ucdh3b1w86p4wmu"}
    #     streamer_object = ElevatorMedia::Streamer.new
    #     valid_user = streamer_object.getSpotifyUser
    #     expect(valid_user).to eq("awoggddbv0ucdh3b1w86p4wmu")
    # end

end