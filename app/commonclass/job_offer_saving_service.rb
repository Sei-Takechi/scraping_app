class JobOfferSavingService
  attr_reader :job_offers
  def initialize(job_offers_array)
    @job_offers = create_instance_with(job_offers_array)
  end

  def create_instance_with(job_offers_array)
    job_offers_array.collect { |offer|
      JobOffer.new(
        heading: offer[0], 
        overview: offer[1], 
        place: offer[2], 
        company_name: offer[3],
      )
    }
  end

  def save_job_offers
    job_offers.each do |job_offer|
      save_job_offer(job_offer)
    end
  end

  def save_job_offer(job_offer)
      job_offer.save
  end

  def associated_company(job_offer)
    Company.find_by(name: job_offer.company_name)
  end

  def is_associated?(job_offer)
    associated_company(job_offer).present?
  end

  def save_with_company_association
    job_offers.each do |job_offer|
      company = associated_company(job_offer)
      job_offer.company_id = company.id if company.present?
      save_job_offer(job_offer)
    end
  end

end