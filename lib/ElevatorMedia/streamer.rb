require 'open_weather'
require 'ElevatorMedia/Streamer'
# http://worldtimeapi.org/api/timezone/America/Montreal
module ElevatorMedia
    class Streamer
  
        # method initialozing the sources or API keys for the API calls below
        def initialize
            @chuck_norris = 'http://api.icndb.com/jokes/random'
            #@open_weather = ENV['open_weather_api']
            @Timer = 'http://worldtimeapi.org/api/timezone/America/Montreal'
        end
  
        # required method from week 10 Codeboxx file that renders interesting HTML content to the elevator's screens
        def getContent(type='weather')
          #  puts getHtmlChoice(type)
            getHtmlChoice(type)
        end
  
        # method that returns a specific html depending on the "type" asked in the getContent method, is 'chuck_norris' by default
        def getHtmlChoice(type)
          if type == 'chuck_norris' 
            return "<div class='elevator-media-streamer-content'>#{JSON.parse(self.getChuckNorrisQuote)['value']['joke']}</div>"  
          end 
          if type == 'weather'  
            return "<div class='elevator-media-streamer-content'>#{self.getWeather}</div>"  
          end 
          if type == 'Timer'  
            return "<div class='elevator-media-streamer-content'>#{JSON.parse(self.getTimer)['datetime']}</div>"  
          end 
        end
  
        # method that gets a random Chuck Norris quote/joke 
        def getChuckNorrisQuote
            @response = RestClient::Request.execute(method: :get, url: @chuck_norris, header: {})
        end
        # method that gets a Time 
        def getTimer
          @response = RestClient::Request.execute(method: :get, url: @Timer, header: {})
      end
  
        # method that gets the weather for a specific city, Quebec in this case
        def getWeather
            options = { units: "metric", APPID: "34282b0d42ef00a0529b546b07c1983b" }
            OpenWeather::Current.city_id(6077243, options)
        end
  
        # method that gets the weather forecast for a selected city, in this case Quebec city
        def getForecast
            options = { units: "metric", APPID: "34282b0d42ef00a0529b546b07c1983b" }
            OpenWeather::Current.city_id(6077243, options)
        end
        ####################
        
  
        # method that gets a response from Spotify to check connection
        # def getSpotifyResponse
        #   RSpotify.raw_response = true
        #   @spotify_response = RSpotify.raw_response
        # end
  
        # method that gets the status of a Spotify connection with the selected client ID and secret
        # def getSpotifyStatus
        #     @status = RSpotify::authenticate(ENV['spot_client_id'], ENV['spot_client_secret'])
        # end
  
        # method that gets a specific Spotify user with the username
        # def getSpotifyUser
        #     @user = RSpotify::User.find("awoggddbv0ucdh3b1w86p4wmu")
        # end
        
    end
  end