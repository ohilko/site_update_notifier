require 'spec_helper'

describe "relationships/new" do
  before(:each) do
    assign(:relationship, stub_model(Relationship,
      :follower_id => 1,
      :followed_id => 1
    ).as_new_record)
  end

  it "renders new relationship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", relationships_path, "post" do
      assert_select "input#relationship_follower_id[name=?]", "relationship[follower_id]"
      assert_select "input#relationship_followed_id[name=?]", "relationship[followed_id]"
    end
  end
end
