# encoding utf-8

require_relative 'instance_counter'

# creating class Route
class Route
  include InstanceCounter
  attr_accessor :stations
  attr_writer :station
  def initialize(station_start, station_end)
    @stations = [station_start, station_end]
    validate
  end

  def add_station(station)
    @stations << station
    @stations[-1], @stations[-2] = @stations[-2], @stations[-1]
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
  # method for checking the entered value

  private

  def validate!
    msg = 'Название станции не может быть пустым'
    [@station_start, @station_end].each { |station| raise msg if station == '' }
  end
end
