module Concerns
  
  module Findable
    def find_by_name(name)
      self.all.find {|item|item.name == name}
    end
    
    def find_or_create_by_name(name)
    sng = self.find_by_name(name)
      if sng == nil
        sng = self.create(name)
      end
      sng
    end
  
  end
end