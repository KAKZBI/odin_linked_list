require_relative './lib/linked_list.rb'
require_relative './lib/node.rb'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

list.insert_at('fish', 2)
puts list