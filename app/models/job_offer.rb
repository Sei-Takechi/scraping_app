class JobOffer < ApplicationRecord
  belongs_to :company, optional: true

  validates :company_name, uniqueness: { scope: :company_id }

end
