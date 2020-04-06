class Api::V1::ServicesController < Api::V1::BaseController
  def index
    respond_with Service.select Service::SERVICE_PARAMS
  end

  def create
    respond_with :api, :v1, Service.create(service_params)
  end

  private

  def service_params
    params.require(:service).permit Service::SERVICE_PARAMS
  end
end
