require "rails_helper"

RSpec.describe Form::HeaderComponent, type: :component do

  it "renders a header element for a form" do
    expect(
      render_inline(described_class.new(title: "Create Item")).css("div").to_html
    ).to  include(
      "Create Item"
    )
  end
end
