require 'spec_helper'

describe "merchants/show.html.erb" do
  before(:each) do
    @merchant = assign(:merchant, stub_model(Merchant,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Merchantname/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Merchantimage/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Menulink/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Merspectext/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Merspecimage/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Meroffertext/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Merofferimage/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Merextra1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Merextra2/)
  end
end
