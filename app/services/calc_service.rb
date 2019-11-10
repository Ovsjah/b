class CalcService
  class << self
    def calc_cost(item_name)
      "#{item_name.size * 2}"
    end
  end
end
