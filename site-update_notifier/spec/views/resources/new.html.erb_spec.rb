require 'spec_helper'

describe "resources/new" do
  before(:each) do
    assign(:resource, stub_model(Resource,
      :url => "MyString",
      :name => "MyString",
      :user_id => 1,
      :timeout => 1,
      :change => false
    ).as_new_record)
  end

  it "renders new resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resources_path, "post" do
      assert_select "input#resource_url[name=?]", "resource[url]"
      assert_select "input#resource_name[name=?]", "resource[name]"
      assert_select "input#resource_user_id[name=?]", "resource[user_id]"
      assert_select "input#resource_timeout[name=?]", "resource[timeout]"
      assert_select "input#resource_change[name=?]", "resource[change]"
    end
  end
end
