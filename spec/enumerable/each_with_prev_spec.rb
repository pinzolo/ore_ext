# coding: utf-8
require "spec_helper"

describe Enumerable do
  describe "#each_with_prev" do
    context "with no argument" do
      context "with block" do
        it "each item with prevent item (first prevent item is nil)" do
          actual = [].tap do |list|
            [1, 2, 3].each_with_prev do |item, prev|
              list << [prev, item]
            end
          end
          expect(actual).to match_array [[nil, 1], [1, 2], [2, 3]]
        end
      end
      context "without block" do
        let(:enum) { [1, 2, 3].each_with_prev }
        it "return Enumerator" do
          expect(enum).to be_an(Enumerator)
        end
        it "returns Enumerator that behaves same when called #each" do
          actual = [].tap do |list|
            enum.each do |item, prev|
              list << [prev, item]
            end
          end
          expect(actual).to match_array [[nil, 1], [1, 2], [2, 3]]
        end
      end
    end
    context "with argument" do
      context "with block" do
        it "each item with prevent item (first prevent item is given argument)" do
          actual = [].tap do |list|
            [1, 2, 3].each_with_prev(0) do |item, prev|
              list << [prev, item]
            end
          end
          expect(actual).to match_array [[0, 1], [1, 2], [2, 3]]
        end
      end
      context "without block" do
        let(:enum) { [1, 2, 3].each_with_prev(0) }
        it "return Enumerator" do
          expect(enum).to be_an(Enumerator)
        end
        it "returns Enumerator that behaves same when called #each" do
          actual = [].tap do |list|
            enum.each do |item, prev|
              list << [prev, item]
            end
          end
          expect(actual).to match_array [[0, 1], [1, 2], [2, 3]]
        end
      end
    end
  end
end
