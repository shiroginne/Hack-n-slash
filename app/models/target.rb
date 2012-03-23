class Target
  include Mongoid::Document

  %w(pic what who why where watch and_what).each do |fname|
    field fname.to_sym
  end
end
