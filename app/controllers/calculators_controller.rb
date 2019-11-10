class CalculatorsController < ApplicationController
  def calc
    RabbitService.start
  end
end
