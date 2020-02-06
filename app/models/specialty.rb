class Specialty < ApplicationRecord
  has_many :jobs
  has_many :doctors, through: :jobs
end
