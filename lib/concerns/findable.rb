module Concerns
  
  module Findable
    def find_by_name(name)
      self.all.find {|item|item.name == name}
    end
    
    def find_or_create_by_name(name)
    i = self.find_by_name(name)
      if i == nil
        new_i = self.create(name)
        new_i
      else
        i
      end
    end
  
  end
end