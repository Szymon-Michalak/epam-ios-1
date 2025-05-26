/// Task 3: Higher Order Functions
///
/// This task involves processing a collection of book data using Swift's higher order functions:
/// - `map`
/// - `compactMap`
/// - `flatMap`
/// - `filter`
/// - `reduce`
///
/// ### Steps:
///
/// 1. **Start with the following array of dictionaries**, each representing a book:
///
/// ```swift
/// let books = [
///     ["title": "Swift Fundamentals", "author": "John Doe", "year": 2015, "price": 40, "genre": ["Programming", "Education"]],
///     ["title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "year": 1925, "price": 15, "genre": ["Classic", "Drama"]],
///     ["title": "Game of Thrones", "author": "George R. R. Martin", "year": 1996, "price": 30, "genre": ["Fantasy", "Epic"]],
///     ["title": "Big Data, Big Dupe", "author": "Stephen Few", "year": 2018, "price": 25, "genre": ["Technology", "Non-Fiction"]],
///     ["title": "To Kill a Mockingbird", "author": "Harper Lee", "year": 1960, "price": 20, "genre": ["Classic", "Drama"]]
/// ]
/// ```
///
/// 2. **Create a global variable** `discountedPrices: [Double]`
///    - Contains book prices with 10% discount applied
///    - Use `map` or `compactMap`
///
/// 3. **Create a global variable** `booksPostedAfter2000: [String]`
///    - Contains titles of books published after 2000
///    - Use `filter` and optional binding
///
/// 4. **Create a global variable** `allGenres: Set<String>`
///    - Collects all genres from the book list
///    - Use `flatMap` to flatten genre arrays and convert to a `Set`
///
/// 5. **Create a global variable** `totalCost: Int`
///    - Total cost to buy one copy of each book
///    - Use `reduce` to sum the prices
///

let books = [
    ["title": "Swift Fundamentals", "author": "John Doe", "year": 2015, "price": 40, "genre": ["Programming", "Education"]],
    ["title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "year": 1925, "price": 15, "genre": ["Classic", "Drama"]],
    ["title": "Game of Thrones", "author": "George R. R. Martin", "year": 1996, "price": 30, "genre": ["Fantasy", "Epic"]],
    ["title": "Big Data, Big Dupe", "author": "Stephen Few", "year": 2018, "price": 25, "genre": ["Technology", "Non-Fiction"]],
    ["title": "To Kill a Mockingbird", "author": "Harper Lee", "year": 1960, "price": 20, "genre": ["Classic", "Drama"]]
]

let discountedPrices: [Double] = books.compactMap {
    guard let price = $0["price"] as? Int else { return nil }
    return Double(price) * 0.9
}

var booksPostedAfter2000: [String] = books
                                        .filter { $0["year"] as? Int ?? 0 > 2000 }
                                        .compactMap { $0["title"] as? String }

var allGenres: Set<String> = Set(
    books
        .compactMap { $0["genre"] as? [String] }
        .flatMap { $0 }
)

var totalCost: Int = books
                        .reduce(0) { $0 + ($1["price"] as? Int ?? 0) }
