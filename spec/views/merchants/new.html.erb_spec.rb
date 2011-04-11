require 'spec_helper'

describe "merchants/new.html.erb" do
  before(:each) do
    assign(:merchant, stub_model(Merchant,
      :merchantname => "MyString",
      :merchantimage => "MyString",
      :menulink => "MyString",
      :tribecomment => "MyText",
      :merachantinfo => "MyText",
      :merspectext => "MyString",
      :merspecimage => "MyString",
      :meroffertext => "MyString",
      :merofferimage => "MyString",
      :meraddress => "MyText",
      :merchantphone => "MyText",
      :merextra1 => "MyString",
      :merextra2 => "MyString"
    ).as_new_record)
  end

  it "renders new merchant form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => merchants_path, :method => "post" do
      assert_select "input#merchant_merchantname", :name => "merchant[merchantname]"
      assert_select "input#merchant_merchantimage", :name => "merchant[merchantimage]"
      assert_select "input#merchant_menulink", :name => "merchant[menulink]"
      assert_select "textarea#merchant_tribecomment", :name => "merchant[tribecomment]"
      assert_select "textarea#merchant_merachantinfo", :name => "merchant[merachantinfo]"
      assert_select "input#merchant_merspectext", :name => "merchant[merspectext]"
      assert_select "input#merchant_merspecimage", :name => "merchant[merspecimage]"
      assert_select "input#merchant_meroffertext", :name => "merchant[meroffertext]"
      assert_select "input#merchant_merofferimage", :name => "merchant[merofferimage]"
      assert_select "textarea#merchant_meraddress", :name => "merchant[meraddress]"
      assert_select "textarea#merchant_merchantphone", :name => "merchant[merchantphone]"
      assert_select "input#merchant_merextra1", :name => "merchant[merextra1]"
      assert_select "input#merchant_merextra2", :name => "merchant[merextra2]"
    end
  end
end
