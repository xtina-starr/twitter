require "spec_helper"

describe TweetsController do
  let!(:tweet) { Tweet.create(author: "Foo") }

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_successful
    end

    it "render the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "is successful" do
      post :create, tweet: {author: "Foo"}
      expect(response).to be_successful
    end

    it "assigns @tweet" do
      post :create
      expect(assigns(:tweet)).to be_a Tweet
    end

    it "redirects to a show template" do
      post :create
      expect(response).to redirect_to tweet_path(assigns(:tweet).id)
    end
  end
  
end