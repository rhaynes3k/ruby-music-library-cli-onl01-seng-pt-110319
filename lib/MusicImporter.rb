class MusicImporter
  attr_accessor :path, :files, :name
  def initialize(path)
    @path = path
    @files = Dir.entries(path).select{|e|e.include?("-")}
  end
    
  
   
end