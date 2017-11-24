module ControllerHelpers
  extend ActiveSupport::Concern

  def response_body
    JSON.parse(response.body) rescue nil
  end
end
