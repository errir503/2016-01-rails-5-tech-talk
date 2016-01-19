class TablesController < ApplicationController
  before_action :set_table

  # This is the only action actually needed, because everything is handled through actioncable
  def show
  end

  def estimate
    fail 'Why do you fail me, ActionCable!?!'
    # @table.estimate(params[:player], params[:estimate])
    # redirect_to table_path(@table.name)
  end

  private

  def set_table
    @table = Table.find_or_create(params[:id])
  end
end
