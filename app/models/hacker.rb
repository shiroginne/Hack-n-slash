class Hacker
  include Mongoid::Document

  field :uid, type: String
  field :name, type: String
  field :email, type: String
  field :karma, type: Integer
  field :karma_point, type: Integer

end
