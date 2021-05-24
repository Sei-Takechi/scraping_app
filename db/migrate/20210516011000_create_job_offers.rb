class CreateJobOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :job_offers do |t|
      t.string :heading
      t.text :overview
      t.string :place
      t.string :company_name, null: false
      t.references :company, foreign_key: true

      t.timestamps
    end
    add_index :job_offers, [:company_name, :company_id], unique: true
  end
end
