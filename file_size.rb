class Node

  attr_reader :name, :size, :children

  def initialize(options, children=[])
    @name = options[:name]
    @size = options[:size]
    @children = children
  end

  def size
    @children.any? ? children_size : @size
  end

  private

  def children_size
    @children.inject(0) { |sum, c| sum + c.size }
  end

end

class TreeFileSystem

  def initialize(path)
    @path = path
    create_tree!
  end

  def create_tree!
    files = Dir["#{path}/*"]

    #TODO : Move this to Node
    @root = Node.new({name: File.basename(path)}, create_children(files))
  end

  def create_children(files)
    
  end

  def root
    Node.new({name: @path})
  end

end
