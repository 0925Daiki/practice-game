require 'rails_helper'

RSpec.describe "Practices", type: :request do
  before do
    @team = FactoryBot.create(:team)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
    end
  end
end
