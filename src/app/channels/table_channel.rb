# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine
# loop that does not support auto reloading.
class TableChannel < ApplicationCable::Channel

  # Called when a client connects (before client calls ```connected()```)
  def subscribed
    stream_from table.to_s
  end

  # Called when a client performs "estimate"
  def estimate(data)
    # Run the business-logic
    table.estimate(data['player'], data['estimation'])
    # Re-broadcast it again to all subscribers
    ActionCable.server.broadcast table, table.to_h
  end

  def reset(_data)
    # Run the business-logic
    table.reset!
    # Re-broadcast it again to all subscribers
    ActionCable.server.broadcast table, table.to_h
  end

  # Any cleanup needed when channel is unsubscribed
  def unsubscribed
  end

  protected

  def table
    Table.find_or_create(params[:table_id])
  end
end
