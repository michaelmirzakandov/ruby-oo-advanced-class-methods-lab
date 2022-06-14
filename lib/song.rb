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
  song = Song.new
  song.save
  song
end

def self.new_by_name(name)
  song = Song.new
  song.name = name
  song
end

def self.create_by_name(name)
  self.new_by_name(name).save.last
end

def self.find_by_name(name)
  self.all.select do |song|
    song.name == name
  end[0]
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)

end

def self.alphabetical
  self.all.sort_by do |song| song.name end
end

def self.new_from_filename(filename)
  x = filename.split(" - ")
  song = self.new_by_name(x[1].gsub(".mp3", ""))
  song.artist_name = x[0]
  song
end

def self.create_from_filename(filename)
  x = self.new_from_filename(filename)
  x.save
  x
end

def self.destroy_all
  @@all = []
end

end