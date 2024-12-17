class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create
  
    def create
      env['warden'].authenticate!
  
      if env['warden'].user
        render json: { message: 'Logged in successfully', user: env['warden'].user }
      else
        render json: { error: 'Login failed' }, status: :unauthorized
      end
    end
  
    def destroy
      env['warden'].logout
      render json: { message: 'Logged out successfully' }
    end
  
    def failure
      render json: { error: 'Authentication failed' }, status: :unauthorized
    end
  end
  