require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VendorsController do

    # This should return the minimal set of attributes required to create a valid
    # Vendor. As you add validations to Vendor, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) { { "name" => "MyString", "address_attributes" => {"line1" => "MyLine1", "line2" => "MyLine2", "city" => "MyCity", "state" => "MyState", "zip" => "MyZip"}, "email" => "MyEmail" } }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # VendorsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET index" do
        it "assigns all vendors as @vendors" do
            vendor = Vendor.create! valid_attributes
            get :index, {}, valid_session
            assigns(:vendors).should eq([vendor])
        end
    end

    describe "GET show" do
        it "assigns the requested vendor as @vendor" do
            vendor = Vendor.create! valid_attributes
            get :show, {:id => vendor.to_param}, valid_session
            assigns(:vendor).should eq(vendor)
        end
    end

    describe "GET new" do
        it "assigns a new vendor as @vendor" do
            get :new, {}, valid_session
            assigns(:vendor).should be_a_new(Vendor)
        end
    end

    describe "GET edit" do
        it "assigns the requested vendor as @vendor" do
            vendor = Vendor.create! valid_attributes
            get :edit, {:id => vendor.to_param}, valid_session
            assigns(:vendor).should eq(vendor)
        end
    end

    describe "POST create" do
        describe "with valid params" do
            it "creates a new Vendor" do
                expect {
post :create, {:vendor => valid_attributes, :address => {"line1" => "MyLine1", "line2" => "MyLine2", "city" => "MyCity", "state" => "MyState", "zip" => "MyZip"}}, valid_session
                }.to change(Vendor, :count).by(1)
            end

            it "assigns a newly created vendor as @vendor" do
                post :create, {:vendor => valid_attributes, :address => {"line1" => "MyLine1", "line2" => "MyLine2", "city" => "MyCity", "state" => "MyState", "zip" => "MyZip"}}, valid_session
                assigns(:vendor).should be_a(Vendor)
                assigns(:vendor).should be_persisted
            end

            it "redirects to the created vendor" do
                post :create, {:vendor => valid_attributes, :address => {"line1" => "MyLine1", "line2" => "MyLine2", "city" => "MyCity", "state" => "MyState", "zip" => "MyZip"}}, valid_session
                response.should redirect_to(Vendor.last)
            end
        end

        describe "with invalid params" do
            it "assigns a newly created but unsaved vendor as @vendor" do
                # Trigger the behavior that occurs when invalid params are submitted
                Vendor.any_instance.stub(:save).and_return(false)
                post :create, {:vendor => { "name" => "invalid value" }}, valid_session
                assigns(:vendor).should be_a_new(Vendor)
            end

            it "re-renders the 'new' template" do
                # Trigger the behavior that occurs when invalid params are submitted
                Vendor.any_instance.stub(:save).and_return(false)
                post :create, {:vendor => { "name" => "invalid value" }}, valid_session
                response.should render_template("new")
            end
        end
    end

    describe "PUT update" do
        describe "with valid params" do
            it "updates the requested vendor" do
                vendor = Vendor.create! valid_attributes
                # Assuming there are no other vendors in the database, this
                # specifies that the Vendor created on the previous line
                # receives the :update_attributes message with whatever params are
                # submitted in the request.
                Vendor.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
                put :update, {:id => vendor.to_param, :vendor => { "name" => "MyString" }}, valid_session
            end

            it "assigns the requested vendor as @vendor" do
                vendor = Vendor.create! valid_attributes
                put :update, {:id => vendor.to_param, :vendor => valid_attributes}, valid_session
                assigns(:vendor).should eq(vendor)
            end

            it "redirects to the vendor" do
                vendor = Vendor.create! valid_attributes
                put :update, {:id => vendor.to_param, :vendor => valid_attributes}, valid_session
                response.should redirect_to(vendor)
            end
        end

        describe "with invalid params" do
            it "assigns the vendor as @vendor" do
                vendor = Vendor.create! valid_attributes
                # Trigger the behavior that occurs when invalid params are submitted
                Vendor.any_instance.stub(:save).and_return(false)
                put :update, {:id => vendor.to_param, :vendor => { "name" => "invalid value" }}, valid_session
                assigns(:vendor).should eq(vendor)
            end

            it "re-renders the 'edit' template" do
                vendor = Vendor.create! valid_attributes
                # Trigger the behavior that occurs when invalid params are submitted
                Vendor.any_instance.stub(:save).and_return(false)
                put :update, {:id => vendor.to_param, :vendor => { "name" => "invalid value" }}, valid_session
                response.should render_template("edit")
            end
        end
    end

    describe "DELETE destroy" do
        it "destroys the requested vendor" do
            vendor = Vendor.create! valid_attributes
            expect {
                delete :destroy, {:id => vendor.to_param}, valid_session
            }.to change(Vendor, :count).by(-1)
        end

        it "redirects to the vendors list" do
            vendor = Vendor.create! valid_attributes
            delete :destroy, {:id => vendor.to_param}, valid_session
            response.should redirect_to(vendors_url)
        end
    end

end
