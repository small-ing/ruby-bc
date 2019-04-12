require_relative 'block'

class Blockchain
  def initialize
    @chain = []
    @all_transactions = []
    @gen = genesis_block
  end

  attr_reader :chain

  def genesis_block
    transactions = {}
    @gen = Block.new(transactions, '0')
    @chain << @gen
  end

  def print_blocks
    for i in 0...@chain.length
      current_block = @chain.at(i)
      puts "Block #{i} #{current_block}"
      puts current_block.print_contents
      puts ''
    end
  end

  def add_block(transactions)
    prev = @chain.at(-1).hash
    new_block = Block.new(transactions, prev)
    proof = 0
    @chain << new_block
    return [new_block, proof]
  end

  def validate_chain
  x = true
  for i in 1..@chain.length do
      current = @chain.at(i)
      previous = @chain.at(i - 1)
      if current.previous_hash != previous.hash
        puts "The previous block's hash does not equal the previous hash value stored in the current block."
        x = false
      end
  end
  if x == true
    puts "This blockchain is good"
  else
    puts "This is no bueno"
  end
  end

  def proof_of_work(block, difficulty = 1)
    proof = block.generate_hash
    nonce = 0
    while proof[0, difficulty] != '0' * difficulty
      nonce += 1
      proof = block.generate_hash
    end
    return proof
  end
end
