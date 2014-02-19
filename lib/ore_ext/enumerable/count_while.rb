# coding: utf-8
module Enumerable
  def count_while
    return to_enum(:count_while) unless block_given?

    count = 0
    each do |item|
      if yield(item)
        count += 1
      else
        return count
      end
    end
    count
  end

  def count_until
    return to_enum(:count_until) unless block_given?

    count = 0
    each do |item|
      if yield(item)
        return count
      else
        count += 1
      end
    end
    count
  end
end
