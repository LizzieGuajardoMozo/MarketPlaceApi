Rails.application.routes.draw do
    #Api definition
    #By defining a namespace under the routes.rb file
    #Rails will automatically map that namespace to a directory matching the name
    #under the controllers folder, in out case the api/ directory
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        # We are going to list our resources here
      end
    end
end
