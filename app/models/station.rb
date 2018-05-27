class Station < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates_presence_of :city, :dock_count, require: true

  def started_at
    
  end 
end