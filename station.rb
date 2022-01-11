# encoding utf-8

require_relative 'instance_counter'

# creat class Station
class Station
  include InstanceCounter
  attr_reader :trains_station, :name, :stations_name
  attr_writer :train
  PATTERN = /^([А-Я])([а-я]){1,}/

  def trains_each(block)
    @trains_station.each do |train|
      block.call(train)
    end
  end

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @@stations << name
  end

  def trains
    trains_station.count
  end

  def arrive_train(train)
    @trains_station << train
  end

  def gone_train(train)
    @trains.delete(train)
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def validate!
    errors = []
    errors << 'Вы ввели неправильное название станции'	if @name !~ PATTERN
    errors << 'Вы не ввели название станции' if @name == ''
    raise errors.join(';') unless errors.empty?
  end
end
