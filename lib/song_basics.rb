class Song
  attr_accessor :name
  attr_reader :artist
    @@all = []
  
  def initialize(name, artist)
    @name = name
    @artist = artist
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
        #binding.pry
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    Song.new(name)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    #binding.pry
  end
end