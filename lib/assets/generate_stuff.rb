# isbn10s
# (0..9).to_a.sort{ rand() -0.5 }[0..10].join

# isbn13s
# (0..9).to_a.sort{ rand() -0.5 }[0..2].join + '-' + (0..9).to_a.sort{ rand() - 0.5 }[0..9].join

100.times do
  BookStore.all.sample.books.create(
    isbn10: (0..9).to_a.sort{ rand() -0.5 }[0..10].join,
    isbn13: (0..9).to_a.sort{ rand() -0.5 }[0..2].join + '-' + (0..9).to_a.sort{ rand() - 0.5 }[0..9].join,
    title: Faker::Book.title,
    author: Faker::Book.author,
    new_price: Faker::Number.decimal(2),
    new_in_stock: Faker::Number.number(3),
    used_price: Faker::Number.decimal(2),
    used_in_stock: Faker::Number.number(3),
    rent_price: Faker::Number.decimal(2),
    rent_in_stock: Faker::Number.number(3)
    )
end