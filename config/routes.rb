CoordsToWeather::Application.routes.draw do
  get("/weather", { :controller => "coords", :action => "fetch_weather" })
  get("/weather/:sign", { :controller => "coords", :action => "fetch_weather" })

end
