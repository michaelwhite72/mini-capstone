my_product = Product.new({ name: "fan", price: 10, description: "Helps keep you cool during those long, hot summers", quantity: 10, supplier_id: 2 })
my_product.save

my_product = Product.new({ name: "Laptop", price: 900, description: "A requirement in 2020 to accomplish either remote employments or schooling", quantity: 5, supplier_id: 1 })
my_product.save

my_product = Product.new({ name: "camera", price: 125, description: "Ever has a moment where you wished you could capture for ever, well this product does that for you with the click of a button", quantity: 4, supplier_id: 3 })
my_product.save

my_product = Product.new({ name: "Mountain Bike", price: 950, description: "a bicycle with a light sturdy frame, broad deep-treaded tires, and multiple gears, originally designed for riding on mountainous terrain.", quantity: 6, supplier_id: 1 })
my_product.save

my_product = Product.new({ name: "Cards Against Humanity", price: 25, description: "This a party game for horrible people", quantity: 3, supplier_id: 2 })
my_product.save

my_product = Product.new({ name: "Stress Ball", price: 10, description: "Squeezing this ball helps to relieve tension in stressful moments", quantity: 14, supplier_id: 3 })
my_product.save

my_product = Product.new({ name: "Mattel Handheld Electronic Football (Classic)", price: 25, description: "This is a classic from the 1980's, try to get your red dot downfield without geting touched", quantity: 2, supplier_id: 3 })
my_product.save

my_supplier = Supplier.new({ name: "Amazon", email: "goods@amazon.com", phone_number: "555-123-7777" })
my_supplier.save

my_supplier = Supplier.new({ name: "Overstock", email: "items@overstock.com", phone_number: "888-555-9999" })
my_supplier.save

my_supplier = Supplier.new({ name: "Craiglist", email: "gotcha@craigslist.com", phone_number: "800-417-4567" })
my_supplier.save

my_image = Image.new({ url: "https://images-na.ssl-images-amazon.com/images/I/71ZV5BcG4wL._AC_SL1500_.jpg" })
my_image.save

my_image = Image.new({ url: "https://image.shutterstock.com/image-vector/laptop-blank-screen-silver-color-260nw-1382811209.jpg", product_id: 2 })
my_image.save

my_image = Image.new({ url: "https://wyattbikes.com/wp-content/uploads/2018/07/Vista-4.jpg", product_id: 3 })
my_image.save

my_image = Image.new({ url: "https://images-na.ssl-images-amazon.com/images/I/61J6MK1LzfL._AC_SL1500_.jpg", product_id: 5 })
my_image.save

camera = Image.new({ url: "https://i5.walmartimages.com/asr/9938be41-a012-49a5-8d03-c52e174cd847_1.013b0f1bac4b9873b0a8290b79cace74.jpeg", product_id: 5 })

Category.create!([
  { name: "Cheap" },
  { name: "Electronic" },
  { name: "Damage" },
  { name: "Home Good" },
])

CategoryProduct.create!([
  { category_id: 1, product_id: 1 },
  { category_id: 1, product_id: 6 },
  { category_id: 2, product_id: 3 },
  { category_id: 2, product_id: 15 },
  { category_id: 2, product_id: 7 },
  { category_id: 3, product_id: 3 },
  { category_id: 3, product_id: 15 },
  { category_id: 3, product_id: 5 },
  { category_id: 4, product_id: 1 },
  { category_id: 4, product_id: 2 },
  { category_id: 4, product_id: 7 },
])

