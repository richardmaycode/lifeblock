# frozen_string_literal: true

class Mosaic::TileComponent < ViewComponent::Base
  def initialize(reflection: nil, date: nil, classes: [])
    @reflection = reflection
    @date = date
    @classes = classes 
  end
end
