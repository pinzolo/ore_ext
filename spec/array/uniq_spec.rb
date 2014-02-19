# coding: utf-8
require "spec_helper"

describe Array do
  describe "#uniq?" do
    it "returns true if items are unique" do
      expect([1, 2, 3, 4, 5].uniq?).to eq true
    end
    it "returns false if items are not unique" do
      expect([1, 2, 3, 4, 1].uniq?).to eq false
    end
  end
end
