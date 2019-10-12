class Song
  
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    x = self.new
    x.save
    x
  end

  def self.new_by_name(name)
    x = self.create
    x.name = name
    x
  end

  def self.create_by_name(name)
    x = self.new_by_name(name)
    x.save
    x
  end

  def self.find_by_name(name)
    @@all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def self.alphabetical
    @@all.sort_by {|s| s.name}.uniq!
  end

  def self.new_from_filename(filename)
    delimiters = [' - ', '.']
    a = filename.split(Regexp.union(delimiters))
    new_y = self.new
    new_y.name = a[1]
    new_y.artist_name = a[0]
    new_y
  end
  
  def self.new_from_filename(filename)
    delimiters = [' - ', '.']
    a = filename.split(Regexp.union(delimiters))
    new_y = self.create
    new_y.name = a[1]
    new_y.artist_name = a[0]
    new_y
  end

end
