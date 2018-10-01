class Node

  attr_reader :neighbors

  def id
    @id
  end
  
  def num_neighbors
    @neighbors.count
  end

  def alone?
    @neighbors.count.zero?
  end

  def connected?
    @neighbors.count.nonzero?
  end
  
  def add_neighbor id
    @neighbors << id
  end

  def links_to_self?
    @neighbors.include? @id
  end
  
  def initialize id, neighbors
    @id = id
    @neighbors = []
    if neighbors.count.nonzero?
      neighbors.each { |n| @neighbors << n }
    end
  end

  def to_s
    neighbor_ids = self.connected? ? @neighbors.join(',') : '---'
    "Node #{@id}: [ #{neighbor_ids } ]"
  end
  
end
