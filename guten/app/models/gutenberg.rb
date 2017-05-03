class Gutenberg
  include Mongoid::Document
  store_in collection: "gutenberg"                        
  field :word, type: String                        
  field :numero, type: Integer                        
  field :nameFile, type: String
end
