# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def set_current_user
    Current.audited_user = current_user
  end
end
