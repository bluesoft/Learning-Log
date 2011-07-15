require 'spec_helper'

describe "logs/edit.html.erb" do
  before(:each) do
    @log = assign(:log, stub_model(Log,
      :description => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit log form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => logs_path(@log), :method => "post" do
      assert_select "input#log_description", :name => "log[description]"
      assert_select "input#log_text", :name => "log[text]"
    end
  end
end
