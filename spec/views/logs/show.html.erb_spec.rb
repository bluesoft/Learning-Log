require 'spec_helper'

describe "logs/show.html.erb" do
  before(:each) do
    @log = assign(:log, stub_model(Log,
      :description => "Description",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
  end
end
