class TablesController < ApplicationController
  before_action :set_table

  def show
  end

  def estimate
    @table.estimate(params[:player], params[:estimate])
    redirect_to "/#{@table.name}"
  end

  private
  def set_table
    @table = Table.find_or_create(params[:table_id])
  end
end
