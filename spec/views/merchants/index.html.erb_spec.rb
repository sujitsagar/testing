require 'spec_helper'

describe "merchants/index.html.erb" do
  before(:each) do
    assign(:merchants, [
      stub_model(Merchant,
        :merchantname => "Merchantname",
        :merchantimage => "Merchantimage",
        :menulink => "Menulink",
        :tribecomment => "MyText",
        :merachantinfo => "MyText",
        :merspectext => "Merspectext",
        :merspecimage => "Merspecimage",
        :meroffertext => "Meroffertext",
        :merofferimage => "Merofferimage",
        :meraddress => "MyText",
        :merchantphone => "MyText",
        :merextra1 => "Merextra1",
        :merextra2 => "Merextra2"
      ),
      stub_model(Merchant,
        :merchantname => "Merchantname",
        :merchantimage => "Merchantimage",
        :menulink => "Menulink",
        :tribecomment => "MyText",
        :merachantinfo => "MyText",
        :merspectext => "Merspectext",
        :merspecimage => "Merspecimage",
        :meroffertext => "Meroffertext",
        :merofferimage => "Merofferimage",
        :meraddress => "MyText",
        :merchantphone => "MyText",
        :merextra1 => "Merextra1",
        :merextra2 => "Merextra2"
      )
    ])
  end

  it "renders a list of merchants" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Merchantname".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Merchantimage".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Menulink".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Merspectext".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Merspecimage".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Meroffertext".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Merofferimage".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Merextra1".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Merextra2".to_s, :count => 2
  end
end
