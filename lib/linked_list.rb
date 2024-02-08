class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end
class LinkedList
    attr_accessor :head_node
    def initialize(head_node)
        @head_node = head_node
    end
    def append(value)
        current_node = @head_node
        new_node = Node.new(value)
        while current_node do
            current_node = current_node.next_node
        end
        current_node.next_node = new_node
    end
    
    def prepend(value)
        new_node = Node.new(value, @head_node)
    end

    def size()
        current_node = @head_node
        currrent_index = 0
        while current_node do
            current_node = current_node.next_node
            currrent_index += 1
        end
        return currrent_index
    end

    def head()
        return @head_node
    end

    def tail()
        current_node = @head_node
        previous_node = nil
        while current_node do
            previous_node = current_node
            current_node = current_node.next_node
        end
        return previous_node
    end

    def at(index)
        current_node = self.head_node
        currrent_index = 0
        while currrent_index < index 
            current_node = current_node.next_node
            currrent_index += 1
        end
        return current_node
    end
    def pop()
        current_node = self.head_node
        previous_node = nil
        while current_node do
            break if current_node.next_node.nil?
            previous_node = current_node
            current_node = current_node.next_node
        end
        previous_node.next_node = nil
        return current_node
    end
    
    def contains?(value)
        current_node = self.head_node
        while current_node do
            return true if current_node.value == value
            current_node = current_node.next_node
        end
        return false
    end
    def find(value)
        current_node = self.head_node
        currrent_index = 0
        while currrent_node
            return currrent_index if currrent_node.value == value
            current_node = current_node.next_node
            currrent_index += 1
        end
        return nil
    end
    def to_s()
        current_node = self.head_node
        string = ""
        while currrent_node
            string << "( #{currrent_node.value} -> )"
            current_node = current_node.next_node
        end
        string << "nil"
        # return string
    end

    def insert_at(value, index)
        current_node self.head_node
        currrent_index = 0
        new_node = Node.new(value)
        while currrent_index < index - 1
            current_node = current_node.next_node
            currrent_index += 1
        end
        new_node.next_node = current_node.next_node
        current_node.next_node = new_node
    end

    def remove_at(index)
        current_node self.head_node
        currrent_index = 0
        while currrent_index < index - 1
            current_node = current_node.next_node
            currrent_index += 1
        end
        current_node.next_node = current_node.next_node.next_node
    end
end
