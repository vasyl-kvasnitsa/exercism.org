class BookStore

  BOOK_DISCOUNTS = [1.0, 0.95, 0.9, 0.8, 0.75]
  BOOK_PRICE = 8

  def self.calculate_price(basket)
    groups = []

    while (new_group = basket.uniq).any?
      new_group.each { |b| basket.delete_at(basket.index(b)) }
      groups << new_group.size
    end

    while groups.include?(3) && groups.include?(5)
      groups.delete_at(groups.index(3))
      groups.delete_at(groups.index(5))
      groups.push(4, 4)
    end

    groups.sum { |group| BOOK_PRICE * group * BOOK_DISCOUNTS[group - 1] }
  end

end
