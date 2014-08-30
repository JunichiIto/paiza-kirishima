class Kirishima
  def main(programmer_count, offers)
    (1..offers.size).flat_map {|n|
      offers.combination(n).map{|offers| OfferGroup.new(offers)}
    }.select {|offer_group|
      offer_group.programmer_count >= programmer_count
    }.min_by(&:total_cost).total_cost
  end
end

class Offer < Struct.new(:programmer_count, :total_cost)
end

class OfferGroup
  def initialize(offers)
    @offers = offers
  end
  def programmer_count
    @programmer_count ||= sum_of(:programmer_count)
  end
  def total_cost
    @total_cost ||= sum_of(:total_cost)
  end
  private
  def sum_of(attr)
    @offers.inject(0){|sum, offer| sum + offer.send(attr) }
  end
end