class Artist
  attr_accessor :name, :song
  
    @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    Artist.new(name)
  end
  
  def songs
    Song.all.each do |s|
      @songs << s.artist == self
    end
  end
  
  def add_song(song)
    @songs << song
    if song.artist == nil
      song.artist = self
    end
  end
end