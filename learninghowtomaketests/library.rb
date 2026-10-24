# Class 2: Library (in lib/library.rb)
#
# Write a Library class that starts with an empty array of books. Give it these methods:
#
# add(book) puts the book in the array and returns the library itself. Raise an ArgumentError if a book with the same title is already there.
# remove(title) removes the book with that title. Raise a KeyError if it doesn’t exist.
# find_by_author(author) returns an array of that author’s books, and an empty array if none.
# titles returns an array of just the titles, sorted alphabetically.
# count_by_author returns a hash with each author as the key and their number of books as the value.
# oldest returns the book with the lowest year, or nil if the library is empty.

class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add(book)
    raise ArgumentError, 'the title is already in the array.' if @books.any? { |b| b.title == book.title }

    @books.push(book)
    self
  end

  def remove(title)
    book = @books.find { |b| b.title == title }
    raise KeyError, "#{title} is not in the library" if book.nil?

    @books.delete(book)
    self
  end

  def find_by_author(author)
    @books.select { |book| book.author == author }
  end

  def titles
    @books.map { |book| book.title }.sort
  end

  def count_by_author
    @books.map(&:author).tally
  end

  def oldest
    @books.min_by(&:year)
  end
end
