# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class TableChannel < ApplicationCable::Channel

  def subscribed
    stream_from table.to_s
  end

  def estimate(data)
    table.estimate(data['player'], data['estimation'])
    ActionCable.server.broadcast table, table.to_h
  end

  def reset(data)
    table.reset!
    ActionCable.server.broadcast table, table.to_h
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  protected
  def table
    Table.find_or_create(params[:table_id])
  end
end
