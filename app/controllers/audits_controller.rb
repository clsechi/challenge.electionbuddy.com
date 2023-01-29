class AuditsController < ApplicationController
  before_action :set_audit, only: %i[show]

  # GET /audits or /audits.json
  def index
    @audits = Audit.all
  end

  # GET /audits/1 or /audits/1.json
  def show; end

  private

  def set_audit
    @audit = Audit.find(params[:id])
  end
end
