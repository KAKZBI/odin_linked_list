require_relative './node.rb'
class LinkedList
    attr_accessor :head_node
    def initialize(head_node = nil)
        @head_node = head_node
    end
    def append(value)     
        new_node = Node.new(value)
        if !@head_node
            @head_node = new_node 
            return
        end
        current_node = @head_node
        while current_node.next_node do
            current_node = current_node.next_node
        end
        current_node.next_node = new_node
    end
    
    def prepend(value)
        new_node = Node.new(value, @head_node)
        @head_node = new_node
    end

    def size
        return 0 unless @head_node
        current_node = @head_node
        current_index = 0
        while current_node.next_node do
            current_node = current_node.next_node
            current_index += 1
        end
        return current_index + 1
    end

    def head
        return @head_node
    end

    def tail
        return nil unless @head_node
        current_node = @head_node
        previous_node = nil
        while current_node do
            previous_node = current_node
            current_node = current_node.next_node
        end
        return previous_node
    end

    def at(index)
        return nil unless index < self.size
        current_node = self.head_node
        current_index = 0
        while current_index < index -1 
            current_node = current_node.next_node
            current_index += 1
        end
        return current_node
    end
    def pop()
        current_node = @head_node 
        if self.size == 1
            last_node = @head_node
            @head_node = @head_node.next_node #Make it nil
            return last_node
        end
        second_to_last_node = nil
        while current_node.next_node do
            second_to_last_node = current_node
            current_node = current_node.next_node
        end
        second_to_last_node.next_node = current_node.next_node #Make it nil
        current_node
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
        current_index = 0
        while current_node
            return current_index if current_node.value == value
            current_node = current_node.next_node
            current_index += 1
        end
        return nil
    end
    def to_s
        current_node = self.head_node
        string = ""
        while current_node
            string << "( #{current_node.value} ) -> "
            current_node = current_node.next_node
        end
        string << "nil"
        return string
    end

    def insert_at(value, index)
        current_node = self.head_node
        current_index = 0
        new_node = Node.new(value)
        while current_index < index - 1
            current_node = current_node.next_node
            current_index += 1
        end
        new_node.next_node = current_node.next_node
        current_node.next_node = new_node
    end

    def remove_at(index)
        current_node = self.head_node
        current_index = 0
        while current_index < index - 1
            current_node = current_node.next_node
            current_index += 1
        end
        current_node.next_node = current_node.next_node.next_node
    end
end
