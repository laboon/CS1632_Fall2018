class Wolf

  # Create a new wolf
  
  def initialize name, size
    @name = name
    @size = size
  end

  def size
    sleep 5
    nil
  end

  def name
    "Bob"
  end

  def bark
    sleep 3
    raise "Barking exception!"
  end

  def howl
    raise "Howling exception"
  end
  
end
