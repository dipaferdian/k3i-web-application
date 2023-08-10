 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/officers", type: :request do
  
  # Officer. As you add validations to Officer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:create_officers) {
    create_list(:officer, 2)
  }

  describe "GET /index" do

    before do
      create_officers
    end

    # i want to expected response like this
    let(:expected_officer) do
      create_officers.map do |officer|
        {
          id: officer.id,
          name: officer.name
        }
      end.sort_by { |officer| officer[:__id__] }.as_json
    end

    it "renders a successful response" do
      get "#{officers_path}.json?page=1"

      ap response.parsed_body

      expect(response).to have_http_status(200)
      expect(response.request.method).to eq("GET")
      expect(response.parsed_body).to eq(expected_officer)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      officer = Officer.create! valid_attributes
      get officer_url(officer)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_officer_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      officer = Officer.create! valid_attributes
      get edit_officer_url(officer)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Officer" do
        expect {
          post officers_url, params: { officer: valid_attributes }
        }.to change(Officer, :count).by(1)
      end

      it "redirects to the created officer" do
        post officers_url, params: { officer: valid_attributes }
        expect(response).to redirect_to(officer_url(Officer.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Officer" do
        expect {
          post officers_url, params: { officer: invalid_attributes }
        }.to change(Officer, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post officers_url, params: { officer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested officer" do
        officer = Officer.create! valid_attributes
        patch officer_url(officer), params: { officer: new_attributes }
        officer.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the officer" do
        officer = Officer.create! valid_attributes
        patch officer_url(officer), params: { officer: new_attributes }
        officer.reload
        expect(response).to redirect_to(officer_url(officer))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        officer = Officer.create! valid_attributes
        patch officer_url(officer), params: { officer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested officer" do
      officer = Officer.create! valid_attributes
      expect {
        delete officer_url(officer)
      }.to change(Officer, :count).by(-1)
    end

    it "redirects to the officers list" do
      officer = Officer.create! valid_attributes
      delete officer_url(officer)
      expect(response).to redirect_to(officers_url)
    end
  end
end
