class TablesController < ApplicationController
  before_action :set_table

  @@tables = Hash.new do |hash, name|
    hash[name] = Table.new(name)
  end

  def show
    @table.estimate(:test, 2)
  end

  def estimate
    @table.estimate(params[:name], params[:estimate])
  end

  private
  def set_table
    @table = @@tables[params[:table_id]]
  end
end
