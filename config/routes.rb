Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products_path" => "products#all_products_action"
  end

  namespace :api do
    get "/camera_path" => "products#camera_action"
  end

  namespace :api do
    get "/fan_path" => "products#fan_action"
  end

  namespace :api do
    get "/laptop_path" => "products#laptop_action"
  end

end
