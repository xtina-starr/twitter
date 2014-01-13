require "spec_helper"

describe Tweet do 
  describe "validations" do
    it "should require a body" do
      tweet = Tweet.create
      expect(tweet.errors[:body]).to include "can't be blank"
    end

    it "should require an author" do
      tweet = Tweet.create
      expect(tweet.errors[:author]).to include "can't be blank"
    end

    it "should not exceed 140 characters" do
      tweet = Tweet.create(body: "a" * 141)
      expect(tweet).to be_invalid
    end
  end


end