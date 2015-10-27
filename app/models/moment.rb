class Moment < ActiveRecord::Base
  validates :happened_at, presence: true

  def self.past_memory
    select do |memory|
      (memory.happened_at.month == Moment.last.happened_at.month) &&
      (memory.happened_at.day == Moment.last.happened_at.day)
    end
  end

  def self.same_location
    where(location: Moment.last.location)
  end

  def self.sample
    where.not(id: Moment.last.id).take(1)
  end

  def self.get_past_moments
    if Moment.past_memory.size > 1
      Moment.past_memory
    elsif Moment.same_location.size > 1
      Moment.same_location.take(1)
    elsif Moment.all.size > 1
      Moment.sample
    else
      Moment.last
    end
  end
end
