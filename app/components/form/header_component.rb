# frozen_string_literal: true

class Form::HeaderComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end

end
