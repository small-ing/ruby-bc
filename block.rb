require 'digest'
require 'date'

# class is a class
class Block
  def initialize(transactions, prev)
    @timestamp = Time.now.getutc
    @transactions = transactions
    @previous_hash = prev
    @nonce = 0
    @hash = generate_hash
  end

  attr_reader :timestamp, :transactions, :previous_hash, :nonce, :hash

  def generate_hash
    block_header = @timestamp.to_s + @transactions.to_s + @previous_hash.to_s + @nonce.to_s
    block_hash = Digest::SHA256.digest block_header
    block_hash = Digest::SHA256.hexdigest block_hash
    return block_hash
  end

  def print_contents
    result = "timestamp: #{@timestamp} \ntransactions: #{@transactions}"
    result += "\ncurrent_hash: #{@hash} \nprevious_hash: #{@previous_hash}"
    return result
  end
end
