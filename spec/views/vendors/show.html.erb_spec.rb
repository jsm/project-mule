require 'spec_helper'

describe "vendors/show" do
  before(:each) do
    @vendor = assign(:vendor, stub_model(Vendor,
      :name => "Name",
      :address => "Address",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/Email/)
  end
end
