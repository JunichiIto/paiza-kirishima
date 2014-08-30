class Kirishima
  def main(programmer_count, offers)
    (1..offers.size).flat_map {|n|
      offers.combination(n).map{|offer_group| OfferGroup.new(offer_group) }
    }.select {|offer_group|
      offer_group.programmer_count >= programmer_count
    }.min_by(&:total_cost).total_cost
  end
end

class Offer < Struct.new(:programmer_count, :total_cost)
end

class OfferGroup
  attr_reader :programmer_count, :total_cost
  def initialize(offers)
    @programmer_count = sum_of(:programmer_count, offers)
    @total_cost = sum_of(:total_cost, offers)
  end
  private
  def sum_of(attr, offers)
    offers.inject(0){|sum, offer| sum + offer.send(attr) }
  end
end