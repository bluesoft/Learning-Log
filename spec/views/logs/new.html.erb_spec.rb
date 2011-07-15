require 'spec_helper'

describe "logs/new.html.erb" do
  before(:each) do
    assign(:log, stub_model(Log,
      :description => "MyString",
      :text => "MyString"
    ).as_new_record)
  end

  it "renders new log form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => logs_path, :method => "post" do
      assert_select "input#log_description", :name => "log[description]"
      assert_select "input#log_text", :name => "log[text]"
    end
  end
end
