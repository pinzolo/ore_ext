# coding: utf-8
module Enumerable
  def sum
    inject(0) { |total, item| total += block_given? ? yield(item) : item }
  end

  def sum_while
    return to_enum(:sum_while) unless block_given?

    inject(0) do |total, item|
      if yield(item)
        total += item
      else
        return total
      end
    end
  end

  def sum_until
    return to_enum(:sum_until) unless block_given?

    inject(0) do |total, item|
      if yield(item)
        return total
      else
        total += item
      end
    end
  end
end
