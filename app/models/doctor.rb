class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :jobs
  has_many :specialties, through: :jobs
  belongs_to :city
end
