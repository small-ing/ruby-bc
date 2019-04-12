require_relative 'blockchain'

bc = Blockchain.new

tr1 = { 'sender' => 'me', 'receiver' => 'also me', 'value' => 'nothing' }
tr2 = { 'sender' => 'me', 'receiver' => 'me', 'value' => 'nothing' }
tr3 = { 'sender' => 'me', 'receiver' => 'me again', 'value' => 'nothing' }
tr4 = { 'sender' => 'me', 'receiver' => 'you', 'value' => 'nothing' }
bc.add_block(tr1)
bc.add_block(tr2)
bc.add_block(tr3)
bc.add_block(tr4)
bc.print_blocks

fake_transaction = {'sender' => 'Jeff Bezos', 'receiver' => 'me', 'value' => 'Amazon'}
bc[2] = fake_transaction
bc.validate_chain
