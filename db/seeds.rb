# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Job.destroy_all
Specialty.destroy_all
City.destroy_all

array_job = ["Dentist", "Generalist", "Surgoen", "Optician"]
array_doctors = []
array_patients = []
array_specialty = []
array_city = [City.create(name: "Lyon"), City.create(name: "Montpellier"), City.create(name: "Paris")]


5.times do |index|
  array_doctors << Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city: array_city[rand(0..2)])
end

5.times do
  array_patients << Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: array_city[rand(0..2)])
end

array_job.each do |name|
  array_specialty << Specialty.create(name: name)
end

5.times do
  Appointment.create(date: Faker::Date.between(from: 2.years.ago, to: Date.today), doctor: array_doctors[rand(0..4)], patient: array_patients[rand(0..4)], city: array_city[rand(0..2)])
end

5.times do |index|
  a = array_specialty[rand(0..3)]
  Job.create(name: a, doctor: array_doctors[index - 1], specialty: a)
end
