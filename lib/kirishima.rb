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
    @offers = offers.flatten
  end
  def programmer_count
    @programmer_count ||= @offers.map(&:programmer_count).inject{|sum, x| sum + x }
  end
  def total_cost
    @total_cost ||= @offers.map(&:total_cost).inject{|sum, x| sum + x }
  end
end