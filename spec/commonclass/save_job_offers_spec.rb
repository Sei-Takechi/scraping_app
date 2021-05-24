require_relative '../../app/commonclass/job_offer_saving_service.rb'
require 'rails_helper'

RSpec.describe "job_offers_save" do

  context "正しいデータのとき" do
    before do
      job_offers_array = [
        [ "募集見出し1", "概要1", "開催場所1", "募集主体1" ],
        [ "募集見出し2", "概要2", "開催場所2", "募集主体2"],
      ]
      @saving_service = JobOfferSavingService.new(job_offers_array)
    end

    it "データが保存されること" do
      expect { @saving_service.save_with_company_association }.to change{ JobOffer.count }.by(2)
    end

  end
end