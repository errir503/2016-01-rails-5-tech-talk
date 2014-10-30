class SecretsController < ApplicationController
  load_and_authorize_resource param_method: :secret_params

  respond_to :html, :json

  def index
    respond_with(@secrets)
  end

  def show
    respond_with(@secret)
  end

  def new
    respond_with(@secret)
  end

  def edit
  end

  def create
    @secret.save
    respond_with(@secret)
  end

  def update
    @secret.update(secret_params)
    respond_with(@secret)
  end

  def destroy
    @secret.destroy
    respond_with(@secret)
  end

  private

  def secret_params
    params.require(:secret).permit(:text)
  end
end
