class Table
  attr_accessor :name, :player_estimates

  def initialize(name, player_estimates={})
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
    player_estimates.delete(player)
  end

  def estimate(player, estimation = nil)
    player_estimates[player] = estimation
  end

  def viable_estimations
    estimations = player_estimates.values.map(&:to_f).reject{ |es| es.nil? || es <= 0 }
    return estimations.sort[1..-2] if estimations.count > 3
    estimations
  end

  def result 
    viable_estimations.inject(&:+) / viable_estimations.count
  end
end
