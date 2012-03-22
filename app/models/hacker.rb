class Hacker
  include Mongoid::Document
  
  field :uid, type: String
  field :name, type: String  
  field :email, type: String
  
end