class Table
  attr_accessor :name, :player_estimates

  @tables = Hash.new do |hash, name|
    hash[name] = Table.new(name)
  end

  def self.find_or_create(name)
    @tables[name]
  end

  def initialize(name, player_estimates = {})
    @name = name
    @player_estimates = player_estimates
  end

  def players
    @player_estimates.keys
  end

  def enter(player)
    estimate(player)
  end

  def leave(player)
    @player_estimates.delete(player)
  end

  def estimate(player, estimation = nil)
    @player_estimates[player] = estimation
  end

  def estimates
    player_estimates.values.map(&:to_f).reject { |es| es.nil? || es <= 0 }
  end

  def viable_estimations
    return estimates.sort[1..-2] if estimates.count > 3
    estimates
  end

  def average
    return 0 unless viable_estimations.any?
    viable_estimations.inject(0, :+) / viable_estimations.count
  end

  def reset!
    players.each do |player|
      @player_estimates[player] = nil
    end
  end

  def to_h
    {
      name: name,
      player_estimates: player_estimates,
      player_count: player_estimates.count,
      average: average
    }
  end

  def to_s
    "table_#{name}"
  end
end
