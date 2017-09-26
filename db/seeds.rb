Supplier.create!([
                  {name: "Lego Emporium", email: "bigbob@lego.co", phone: "801-555-9878"},
                  {name: "Legos and Stuff", email: "legomaster@gmail.com", phone: "310-555-9999"},
                  {name: "Roci's Van", email: "roci@yahoo.com", phone: "212-989-5556"}
                  ])


Product.create!([
                {name: "HanSolo", price: 10, description: "coolest lego ever", supplier_id: 1},
                {name: "DaftPunk", price: 100, description: "funkiest lego ever", supplier_id: 2},
                {name: "KnightRider", price: 33, description: "Don't Hassle the Hoff", supplier_id: 3},
                {name: "BreakingBad", price: 42, description: "I am the one who knocks.", supplier_id: 1},
                {name: "Goonies", price: 300, description: "Sloth love Chunk", supplier_id: 2},
                {name: "RonBurgundy", price: 400, description: "I'm Ron Burgundy?", supplier_id: 3}
                ])


Image.create!([
              {product_id: 1, url: "https://vignette4.wikia.nocookie.net/lego/images/7/78/29307519626_5efb560901_b.jpg/revision/latest?cb=20160901113934"},
              {product_id: 2, url: "http://cdn.hiconsumption.com/wp-content/uploads/2013/12/LEGO-Daft-Punk-Minifigures.jpg"},
              {product_id: 3, url: "http://cdn.hiconsumption.com/wp-content/uploads/2013/12/LEGO-Knight-Rider-Set.jpg"},
              {product_id: 4, url: "http://cdn.hiconsumption.com/wp-content/uploads/2013/12/Breaking-Bad-LEGO-Superlab-Set.jpg"},
              {product_id: 5, url: "http://cdn.hiconsumption.com/wp-content/uploads/2013/12/The-Goonies-30th-Anniversary-LEGO-Set.jpg"},
              {product_id: 6, url: "http://cdn.hiconsumption.com/wp-content/uploads/2013/12/Ron-Burgundy-LEGO-Minifgure.jpg"}
              ])

Category.create!(name: "TV")
Category.create!(name: "Movie")
Category.create!(name: "Badass")

CategoryProduct.create!(product_id: 1, category_id: 2)
CategoryProduct.create!(product_id: 1, category_id: 3)
CategoryProduct.create!(product_id: 2, category_id: 3)
CategoryProduct.create!(product_id: 3, category_id: 1)
CategoryProduct.create!(product_id: 3, category_id: 3)
CategoryProduct.create!(product_id: 4, category_id: 1)
CategoryProduct.create!(product_id: 4, category_id: 3)
CategoryProduct.create!(product_id: 5, category_id: 2)
CategoryProduct.create!(product_id: 6, category_id: 2)











