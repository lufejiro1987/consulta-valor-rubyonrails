Rails.application.routes.draw do

  get '/uf/:date', to: 'consultas#uf_value'
  get '/client/:client', to: 'consultas#client_stats'

end
