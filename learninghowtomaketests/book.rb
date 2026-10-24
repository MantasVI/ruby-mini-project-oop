class Book
  attr_reader :title, :author, :year

  def initialize(title, author, year)
    @title = title
    @author = author
    @year = year
  end

  def to_s
    "#{@title} #{@author}"
  end

  def old?
    @year < 2000
  end
end
