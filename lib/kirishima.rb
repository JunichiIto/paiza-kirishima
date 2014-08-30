class Kirishima
  def self.main(programmer_count, offers)
    self.new.main(programmer_count, offers)
  end

  def main(programmer_count, offers)
    (1..offers.size)
      .flat_map{|n| build_offer_groups(n, programmer_count, offers) }
      .select(&:programmers_enough?)
      .map(&:total_cost)
      .min
  end

  private

  def build_offer_groups(n, programmer_count, offers)
    offers
      .combination(n)
      .map{|offer_group| OfferGroup.new(offer_group, programmer_count) }
  end

  class OfferGroup
    attr_reader :total_cost, :programmers_enough
    alias :programmers_enough? :programmers_enough

    def initialize(offers, required_programmer_count)
      @programmers_enough = sum_of(:programmer_count, offers) >= required_programmer_count
      @total_cost = sum_of(:total_cost, offers)
    end

    private

    def sum_of(attr, offers)
      offers.inject(0){|sum, offer| sum + offer.send(attr) }
    end
  end
end
