require_relative '../bank_account'

RSpec.describe BankAccount do
  let(:account) { BankAccount.new('Anna', 100) }

  describe '#initialize' do
    it 'stores the owner' do
      expect(account.owner).to eq('Anna')
    end

    it 'stores the starting balance' do
      expect(account.balance).to eq(100)
    end

    it 'defaults the balance to 0' do
      expect(BankAccount.new('Tom').balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'adds the amount to the balance' do
      account.deposit(50)
      expect(account.balance).to eq(150)
    end

    it 'raises ArgumentError for zero or negative amounts' do
      expect { account.deposit(0) }.to raise_error(ArgumentError)
      expect { account.deposit(-10) }.to raise_error(ArgumentError)
    end
  end

  describe '#withdraw' do
    it 'subtracts the amount from the balance' do
      account.withdraw(30)
      expect(account.balance).to eq(70)
    end

    it 'raises ArgumentError when there is not enough money' do
      expect { account.withdraw(500) }.to raise_error(ArgumentError)
    end

    it 'does not change the balance when the withdrawal fails' do
      begin
        account.withdraw(500)
      rescue ArgumentError
        nil
      end
      expect(account.balance).to eq(100)
    end

    it 'raises ArgumentError for zero or negative amounts' do
      expect { account.withdraw(0) }.to raise_error(ArgumentError)
    end
  end

  describe '#to_s' do
    it 'returns the owner and balance' do
      expect(account.to_s).to eq('Anna: 100')
    end
  end

  describe '#transfer_to' do
    it 'moves money from one account to another' do
      other = BankAccount.new('Tom', 20)
      account.transfer_to(other, 40)
      expect(account.balance).to eq(60)
      expect(other.balance).to eq(60)
    end

    it 'raises ArgumentError when there is not enough money' do
      other = BankAccount.new('Tom', 20)
      expect { account.transfer_to(other, 500) }.to raise_error(ArgumentError)
    end
  end
end
