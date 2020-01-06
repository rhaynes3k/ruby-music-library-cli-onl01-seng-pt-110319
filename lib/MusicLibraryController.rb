class MusicLibraryController
  #attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    command = gets
    until command == "exit" do
      command = gets.chomp
    end
  end
  
  def list_songs
    sng = Song.all.sort_by!{ |m| m.name}
    sng.each_with_index {|s, i|puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end
  
  def list_artists
    art = Artist.all.sort_by!{ |a| a.name}
    art.each_with_index {|a, i|puts "#{i+1}. #{a.name}"} 
  end
  
  def list_genres
    gen = Genre.all.sort_by!{ |g| g.name}
    gen.each_with_index {|g, i|puts "#{i+1}. #{g.name}"} 
  end
    
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    art = gets
    if artist = Artist.find_by_name(art)
     # binding.pry
    artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |s, i|
      puts "#{i}. #{s.name} - #{s.genre.name}"
    #     #binding.pry
    end
  end
  end
end