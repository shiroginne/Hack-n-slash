class Target
  include Mongoid::Document

  %w(pic description).each do |fname|
    field fname.to_sym, type: String
  end
  field :date, type: Date
  
  
end
