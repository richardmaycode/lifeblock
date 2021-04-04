require "rails_helper"

RSpec.describe Form::BodyComponent, type: :component do
  it "renders the form content and includes the correct form id" do
    expect(
      render_inline(described_class.new(frame_id: "item-form")) { "Content" }.css("#item-form").to_html
    ).to include(
      "Content"
    )
  end
end
