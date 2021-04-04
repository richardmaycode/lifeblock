# frozen_string_literal: true

class FormComponent < ViewComponent::Base
  renders_one :header, Form::HeaderComponent
  
  renders_one :body, Form::BodyComponent
end
