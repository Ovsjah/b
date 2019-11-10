class CalculatorsController < ApplicationController
  def calc
    RabbitService.start('item_cost')
  end
end
