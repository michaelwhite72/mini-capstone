require "http"

system "clear"

response = HTTP.get("http://localhost:3000//api/products")

all= response.parse
puts all

response = HTTP.get("http://localhost:3000//api/products/3")

third = response.parse
puts third

puts "What is the product?"
# @product = Product.new(
#   name: params[:title],
#   price: params[:price],
#   image_path: params[:image_path],
#   description: params[:description]
response = HTTP.post("http://localhost:3000//api/products")



