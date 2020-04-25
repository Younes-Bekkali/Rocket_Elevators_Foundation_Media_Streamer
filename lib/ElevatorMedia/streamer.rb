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
  
        
        def getContent(type='weather')
          #  puts getHtmlChoice(type)
            #getHtmlChoice(type)
            if type == 'chuck_norris' 
              obj = JSON.parse(self.getChuckNorrisQuote)['value']['joke']
              html="<div class='elevator-media-streamer-content'>#{obj}</div>"  
              return html  
            end 
            if type == 'weather' 
              obj =  self.getWeather
              html="<div class='elevator-media-streamer-content'>#{obj}</div>"  
              return html
            end 
            if type == 'Timer'  
              obj = JSON.parse(self.getTimer)['datetime']
              html="<div class='elevator-media-streamer-content'>#{obj}</div>"  
              return html
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
  
        # method that gets the weather for a specific city, Montreal in this case
        def getWeather
            options = { units: "metric", APPID: "34282b0d42ef00a0529b546b07c1983b" }
            OpenWeather::Current.city_id(6077243, options)
        end
  
        # method that gets the weather forecast for a selected city, in this case Montreal city
        def getForecast
            options = { units: "metric", APPID: "34282b0d42ef00a0529b546b07c1983b" }
            OpenWeather::Current.city_id(6077243, options)
        end
       
        
    end
  end