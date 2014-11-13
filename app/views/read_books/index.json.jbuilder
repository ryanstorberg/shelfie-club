json.array!(@read_books) do |read_book|
  json.extract! read_book, :id
  json.url read_book_url(read_book, format: :json)
end
