# coding: utf-8
module Enumerable
  def average(ignore_nil = true)
    total = 0.0
    count = 0
    each do |item|
      value = block_given? ? yield(item) : item
      total += value unless value.nil?
      count += 1 unless value.nil? && ignore_nil
    end
    total / count
  end
end
