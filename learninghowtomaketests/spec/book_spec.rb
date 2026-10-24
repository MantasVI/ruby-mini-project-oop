require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new('lolas', 'loleris', 1965) }

  describe '#initialize' do
    it 'initializes all 3 values' do
      expect(book.title).to eq('lolas')
      expect(book.author).to eq('loleris')
      expect(book.year).to eq(1965)
    end
  end

  describe '#to_s' do
    it 'returns expected text' do
      expect(book.to_s).to eq('lolas loleris')
    end
  end

  describe '#old?' do
    it 'testing year 1999 for true or false (true)' do
      expect(Book.new('aaa', 'bbb', 1999).old?).to be true
    end
    it 'testing year 2000 for true or false (false)' do
      expect(Book.new('ccc', 'ddd', 2000).old?).to be false
    end
    it 'testing year 2001 for true or false (false)' do
      expect(Book.new('eee', 'fff', 2001).old?).to be false
    end
  end
end
