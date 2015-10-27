class MomentSerializer < ActiveModel::Serializer
  attributes :id, :content, :caption, :happened_at, :location

  # Convert timestamps to unix offset (milliseconds) 
  def happened_at
    object.happened_at.to_i * 1000
  end
end
