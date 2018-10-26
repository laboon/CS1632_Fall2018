require_relative "wolf"

class WolfPack

  # This allows us to access @wolves externally from the object
  # It acts kind of like "public" in Java.
  # Example:
  # wolf_pack = WolfPack::new
  # wolf_pack.wolves.count
  # ^- This will return 0
  # wolf_pack.wolves << Wolf::new "joe", 5
  # ^- This will add a new wolf named joe, size of 5
  attr_accessor :wolves

  # Create a new wolf pack, with no wolves
  def initialize
    @wolves = []
  end

  # Make all wolves in pack howl by calling their
  # .howl method.  If there are no wolves in the pack,
  # do nothing.
  def all_howl
    @wolves.each { |wolf| wolf.howl }
  end

  # Return the name of one random wolf in the pack.
  # If there are no wolves, return nil.
  def one_wolf
    return nil if @wolves.empty?
    @wolves.sample.name
  end

  # Add a new wolf to the pack
  def add_wolf wolf
    @wolves << wolf
  end

  # Return the size of the wolf with the largest size in @wolves
  def biggest_wolf
    @wolves.map { |w| w.size }.max
  end

  
end
