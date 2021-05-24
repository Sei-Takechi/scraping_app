class JobOffersController < ApplicationController

  def index
    @job_offers = Company.all.collect { |company| company.job_offers }.flatten
  end

end
