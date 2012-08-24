class Target
  include Mongoid::Document

  %w(name pic description).each do |fname|
    field fname.to_sym, type: String
  end
  field :date, type: Date
  
  has_many :speeches
  has_many :hackers
end
