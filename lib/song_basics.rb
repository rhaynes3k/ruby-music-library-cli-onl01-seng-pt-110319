class Song
  attr_accessor :name
  attr_reader :artist, :genre
    @@all = []
  

  def initialize(name, artist=nil, genre= nil)
    @name = name
    self.artist = artist if artist          #invokes #artist= instead of @artist instance variable
    self.genre = genre if genre
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
  
  def artist=(artist)                       # setter method
    @artist = artist
    artist.add_song(self)
  end
  
  def genre= (genre)
    @genre = genre
    unless genre.songs.include?(self)
        genre.songs << self
    end
  end
  
end