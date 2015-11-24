include Enumerable
Node = Struct.new(:value, :next)
class Lista
  attr_accessor :head,:tail ,:size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  
  def each
    node = @head
    while node != nil
      yield node.value
      node=node.next
    end
  end
  
  def insert_beggining(value)
    node = Node.new(value)
    if @head.nil?
        @head = node
        @tail = node
    else
      node.back = @tail
      @tail.next = node
      @tail = node
    end 
    @size +=1
  end
  
  def insert_end(value)#primero que hice
    node = Node.new(value)
    if @head.nil?
        @head = node
        @tail = node
    else
      node.next = @head
      @head = node
    end 
    @size +=1
  end
  
  def extract_begginig
    @tail=@tail.back
    @tail.next = nil
    @size -=1
  end
  
  def extract_end
    @head=@head.next
    @size -=1
  end
  

  def mostrar()   #debería ser to_s
    #@head.value
    nodo_actual = Node.new(@head.value)
    nodo_actual.next = @head.next
    aux=[]
    while nodo_actual.next != nil
        aux.push("#{nodo_actual.value}")
        nodo_actual = nodo_actual.next
    end
    aux.push(nodo_actual.value)
    aux.reverse.join(",")
  end
  
  def size()
    count 
  end

end

class Node
  attr_accessor :value, :next, :back

  def initialize(dato)
    @next = nil
    @back = nil
    @value = dato
  end 
end
