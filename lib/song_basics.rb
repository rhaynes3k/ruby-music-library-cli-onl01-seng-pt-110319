class Song
  extend Concerns::Findable
  attr_accessor :name, :genre
  attr_reader :artist
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
  
  def self.new_from_filename(filename)
    #binding.pry
    @name = filename.split("-")
    song = self.new(@name[1].strip)
    #binding.pry
    song.artist = (Artist.find_or_create_by_name(@name[0].strip))
    # g = @name[2].split(".mp3")
    # g = g[0].strip
    # song.genre = Genre.new(g)
#binding.pry
  end
  # def self.find_by_name(name)
  #   self.all.find do|s|
  #   s.name == name
  #   end
  # end
  
  # def self.find_or_create_by_name(name)
  #   sng = self.find_by_name(name)
  #     if sng == nil
  #       sng = self.create(name)
  #     end
  #     sng
      
  # end
  
  
  
  
  
  
end