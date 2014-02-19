# coding: utf-8
module Enumerable
  def sum
    total = 0
    each { |item| total += block_given? ? yield(item) : item }
    total
  end

  def sum_while
    return to_enum(:sum_while) unless block_given?

    total = 0
    each do |item|
      if yield(item)
        total += item
      else
        return total
      end
    end
    total
  end

  def sum_until
    return to_enum(:sum_until) unless block_given?

    total = 0
    each do |item|
      if yield(item)
        return total
      else
        total += item
      end
    end
    total
  end
end
