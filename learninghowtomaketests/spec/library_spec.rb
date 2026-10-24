require_relative '../book'
require_relative '../library'

RSpec.describe Library do
  let(:library) { Library.new }

  let(:emma)    { Book.new('Emma', 'Austen', 1815) }
  let(:dune)    { Book.new('Dune', 'Herbert', 1965) }
  let(:messiah) { Book.new('Dune Messiah', 'Herbert', 1969) }

  context 'when the library is empty' do
    it 'has no books' do
      expect(library.books).to be_empty
    end

    it 'has no titles' do
      expect(library.titles).to eq([])
    end

    it 'counts no authors' do
      expect(library.count_by_author).to eq({})
    end

    it 'has no oldest book' do
      expect(library.oldest).to be_nil
    end

    it 'finds no books by an author' do
      expect(library.find_by_author('Austen')).to eq([])
    end

    it 'raises KeyError when removing a book' do
      expect { library.remove('Dune') }.to raise_error(KeyError)
    end
  end

  context 'when the library has books' do
    before do
      library.add(emma)
      library.add(dune)
      library.add(messiah)
    end

    describe '#add' do
      let(:extra) { Book.new('Ulysses', 'Joyce', 1922) }

      it 'adds one book' do
        expect { library.add(extra) }.to change { library.books.length }.by(1)
      end

      it 'returns the library itself' do
        expect(library.add(extra)).to be(library)
      end

      it 'raises ArgumentError for a duplicate title' do
        expect { library.add(dune) }.to raise_error(ArgumentError)
      end

      it 'does not add the duplicate' do
        begin
          library.add(dune)
        rescue ArgumentError
          nil
        end
        expect(library.books.length).to eq(3)
      end
    end

    describe '#remove' do
      it 'takes the book out' do
        library.remove('Dune')
        expect(library.books).not_to include(dune)
      end

      it 'leaves the other books alone' do
        library.remove('Dune')
        expect(library.books).to contain_exactly(emma, messiah)
      end

      it 'raises KeyError for an unknown title' do
        expect { library.remove('Nope') }.to raise_error(KeyError)
      end
    end

    describe '#find_by_author' do
      it 'returns all books by that author' do
        expect(library.find_by_author('Herbert')).to contain_exactly(dune, messiah)
      end

      it 'returns a single book when there is only one' do
        expect(library.find_by_author('Austen')).to eq([emma])
      end

      it 'returns an empty array for an unknown author' do
        expect(library.find_by_author('Nobody')).to eq([])
      end
    end

    describe '#titles' do
      it 'returns the titles sorted alphabetically' do
        expect(library.titles).to eq(['Dune', 'Dune Messiah', 'Emma'])
      end
    end

    describe '#count_by_author' do
      it 'counts the books per author' do
        expect(library.count_by_author).to eq({ 'Austen' => 1, 'Herbert' => 2 })
      end
    end

    describe '#oldest' do
      it 'returns the book with the lowest year' do
        expect(library.oldest).to be(emma)
      end
    end
  end
end
