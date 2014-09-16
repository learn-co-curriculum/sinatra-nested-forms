require 'spec_helper'

describe "FormsLab::App" do
  describe "GET '/'" do
    before(:each) do
      get '/'
    end

    it "returns a 200 status code" do
      expect(last_response.status).to eq(200)
    end

    it "renders the instructions" do
      expect(last_response.body).to include("Welcome to the Nested Forms Lab!")
      expect(last_response.body).to include("let's navigate to the '/new'")
    end
  end

  describe "GET '/new'" do
    before(:each) do
      get '/new'
    end

    it "returns a 200 status code" do
      expect(last_response.status).to eq(200)
    end

    it "renders a new form" do
      expect(last_response.body).to include("<form")
      expect(last_response.body).to include("pirate[weight]")
      expect(last_response.body).to include("ship[1][type]")
    end
  end

  describe "POST '/pirates'" do
    before do
      post '/pirates', {
        "pirate"=> {
          "name"=>"Ian",
          "weight"=>"165",
          "height"=>"95"
        },
        "ship"=> {
          "0"=> {
            "name"=>"Titanic",
            "type"=>"Steam Liner",
            "booty"=>"Silver"},
          "1"=> {
            "name"=> "Carpathia",
            "type"=>"Rescue Ship",
            "booty"=>"Inner Tubes"
          }
        }
      }
    end
  end
end
