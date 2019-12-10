class StatisticController < ApplicationController
  def index
    vehicle_names = Vehicle.join_hirings.pluck(:name)
    @results = {}
    vehicle_names.each {|name| @results[name] += 1}
  end
end
