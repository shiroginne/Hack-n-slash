class Speech
  include Mongoid::Document
  belongs_to :target
  belongs_to :hacker
  
  field :name, type: String
  field :description, type: String
  
end
