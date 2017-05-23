# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render json: { errors: [{
      detail: 'Record can\'t be found',
      status: '404',
      code: 'record_not_found'
    }] }, status: 404
  end
end
