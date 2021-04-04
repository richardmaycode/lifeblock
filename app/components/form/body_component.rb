# frozen_string_literal: true

class Form::BodyComponent < ViewComponent::Base
  def initialize(frame_id:)
    @frame_id = frame_id
  end
end
