class CalculatorsController < ApplicationController
  def calc
    CostCalc.start
  end
end
