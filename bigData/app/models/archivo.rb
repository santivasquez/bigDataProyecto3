class Archivo
  include Mongoid::Document
  field :titulo, type: String
  field :autor, type: String
  field :body, type: String
    
    
    validates :titulo,presence: true, length: {minimum:2, maximum:25}
    
    def self.search(search)
        if search
            any_of({titulo: /#{search}/i},{body: /#{search}/i})
        end
    end
    
    
    
end
