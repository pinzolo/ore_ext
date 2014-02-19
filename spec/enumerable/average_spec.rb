# coding: utf-8
require "spec_helper"

describe Enumerable do
  describe "average" do
    context "without block" do
      it "returns simple sum" do
        expect([1, 2, 3, 4, 5].average).to eq 3.0
      end
    end
    context "with block" do
      it "returns calculated sum by given block" do
        expect([1, 2, 3, 4, 5].average { |i| i * i }).to eq 11.0
      end
    end
    context "sequence is empty" do
      it "returns NaN" do
        expect([].average.nan?).to eq true
      end
    end
    context "sequence contains nil" do
      context "when argument is nothing" do
        it "ignore nil" do
          expect([1, 2, 3, 4, nil].average).to eq 2.5
        end
      end
      context "when argument is true" do
        it "ignore nil" do
          expect([1, 2, 3, 4, nil].average(true)).to eq 2.5
        end
      end
      context "when argument is false" do
        it "not ignore nil" do
          expect([1, 2, 3, 4, nil].average(false)).to eq 2.0
        end
      end
    end
  end
end
