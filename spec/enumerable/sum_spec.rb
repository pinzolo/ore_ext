# coding: utf-8
require "spec_helper"

describe Enumerable do
  describe "sum" do
    context "without block" do
      it "returns simple sum" do
        expect([1, 2, 3, 4, 5].sum).to eq 15
      end
    end
    context "with block" do
      it "returns calculated sum by given block" do
        expect([1, 2, 3, 4, 5].sum { |i| i * i }).to eq 55
      end
    end
  end
  describe "#sum_while" do
    context "with block" do
      it "returns sum from first while given block returns true" do
        expect([1, 2, 3, 4, 5].sum_while { |i| i < 4 }).to eq 6
      end
      it "returns sum from first if all items satisfy given condition" do
        expect([1, 2, 3, 4, 5].sum_while { |i| i > 0  }).to eq 15
      end
    end
    context "without block" do
      let(:enum) { [1, 2, 3, 4, 5].sum_while }
      it "returns Enumerator" do
        expect(enum).to be_an(Enumerator)
      end
      it "returns Enumerator that behaves same when called #each" do
        expect(enum.each { |i| i < 4 }).to eq 6
      end
    end
  end
  describe "#sum_until" do
    context "with block" do
      it "returns sum from first until given block returns true" do
        expect([1, 2, 3, 4, 5].sum_until { |i| i > 4 }).to eq 10
      end
      it "returns count from first if no item satisfy given condition" do
        expect([1, 2, 3, 4, 5].sum_until { |i| i.nil?  }).to eq 15
      end
    end
    context "without block" do
      let(:enum) { [1, 2, 3, 4, 5].sum_until }
      it "returns Enumerator" do
        expect(enum).to be_an(Enumerator)
      end
      it "returns Enumerator that behaves same when called #each" do
        expect(enum.each { |i| i > 4 }).to eq 10
      end
    end
  end
end

