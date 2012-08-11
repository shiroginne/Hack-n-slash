class Speech
  include Mongoid::Document
  belongs_to :target
  belongs_to :hacker
  
end
