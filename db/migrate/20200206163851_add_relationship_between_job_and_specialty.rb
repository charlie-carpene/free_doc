class AddRelationshipBetweenJobAndSpecialty < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :doctor, foreign_key: true
    add_reference :jobs, :specialty, foreign_key: true
  end
end
