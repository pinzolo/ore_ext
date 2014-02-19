# coding: utf-8
module Enumerable
  def each_with_prev(first_prev = nil)
    return to_enum(:each_with_prev, first_prev) unless block_given?

    prev = first_prev
    each do |item|
      yield(item, prev)
      prev = item
    end
    self
  end
end

# TODO: Implements Enumerator#with_prev
