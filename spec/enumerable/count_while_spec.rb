# coding: utf-8
require "spec_helper"

describe Enumerable do
  describe "#count_while" do
    context "with block" do
      it "returns count from first while given block returns true" do
        expect([1, 2, 3, 4, 5].count_while { |i| i < 4 }).to eq 3
      end
    end
    context "without block" do
      let(:enum) { [1, 2, 3, 4, 5].count_while }
      it "returns Enumerator" do
        expect(enum).to be_an(Enumerator)
      end
      it "returns Enumerator that behaves same when called #each" do
        expect(enum.each { |i| i < 4 }).to eq 3
      end
    end
  end
  describe "#count_until" do
    context "with block" do
      it "returns count from first until given block returns true" do
        expect([1, 2, 3, 4, 5].count_until { |i| i > 4 }).to eq 4
      end
    end
    context "without block" do
      let(:enum) { [1, 2, 3, 4, 5].count_until }
      it "returns Enumerator" do
        expect(enum).to be_an(Enumerator)
      end
      it "returns Enumerator that behaves same when called #each" do
        expect(enum.each { |i| i > 4 }).to eq 4
      end
    end
  end
end
