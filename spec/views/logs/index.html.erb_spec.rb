require 'spec_helper'

describe "logs/index.html.erb" do
  before(:each) do
    assign(:logs, [
      stub_model(Log,
        :description => "Description",
        :text => "Text"
      ),
      stub_model(Log,
        :description => "Description",
        :text => "Text"
      )
    ])
  end

  it "renders a list of logs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
