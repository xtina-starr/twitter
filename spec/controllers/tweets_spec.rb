require "spec_helper"

describe TweetsController do
  let!(:tweet) { Tweet.create(author: "Foo", body: "Hello World!") }

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
      post :create, tweet: {body: "Hello World!", author: "Mr. Foo"}
      expect(assigns(:tweet)).to be_a Tweet
    end

    it "increse in the database" do
      old_count = Tweet.count
      post :create, tweet: {body: "Hello World!", author: "Mr. Foo"}
      expect(Tweet.count).to eq(old_count + 1)
    end


    it "redirects to a show template" do
      post :create, tweet: {body: "Hello World!", author: "Mr. Foo"}
      expect(response).to redirect_to tweet_show_path(assigns(:tweet).id)
    end

    it "renders new when tweet can't be saved" do
      post :create, tweet: {body: "a" * 141, author: "Mrs. Baz"}
      expect(response).to render_template("new")
    end

    it "assigns @tweet" do
      get :show, id: Tweet.first.id
      expect(assigns(:tweet)).to be_a Tweet
    end
  end
  
end