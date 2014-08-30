class Kirishima
  def main(programmer_count, offers)
    all_combinations = (1..offers.size).flat_map do |n|
      offers.combination(n).to_a
    end
    counts_and_moneys = all_combinations.map do |offer_array|
      [offer_array.map(&:first).inject{|sum,x| sum + x }, offer_array.map(&:last).inject{|sum,x| sum + x }]
    end
    counts_and_moneys.select{|counts, _| counts >= programmer_count }.min_by(&:last).last
  end
end