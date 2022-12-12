require 'rails_helper'

RSpec.describe "Openings", type: :request do
  describe "GET /openings" do
    it "works! (now write some real specs)" do
      get openings_index_path
      expect(response).to have_http_status(200)
    end
  end
end
