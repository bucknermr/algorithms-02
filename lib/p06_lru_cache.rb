require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    node = @map[key]

    if node
      update_node!(node)
    else
      eject! if count == @max
      calc!(key)
    end

    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    @store.append(key, @prc.call(key))
    @map[key] = @store.last
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    key = node.key
    val = node.val
    node.remove
    @store.append(key, val)
  end

  def eject!
    node = @store.first
    node.remove
    @map.delete(node.key)
  end
end
