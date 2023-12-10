# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def logout
        session.delete(:user_id)
        redirect_to root_url
       end
end
