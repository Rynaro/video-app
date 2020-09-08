class Video < ApplicationRecord
  include Hashid::Rails

  has_enumeration_for :status, with: VideoStatus,
                               create_scopes: true,
                               create_helpers: true,
                               required: true

  attribute :status, :string, default: VideoStatus::ACTIVE

  belongs_to :channel
  has_many :video_movements, dependent: :delete_all

  has_one_attached :video
  has_one_attached :thumbnail

  def self.related_by_channel(channel_id, video_id)
    where(channel_id: channel_id)
  end

  def views
    video_movements.map(&:action).select { |action| action == VideoMovementAction::VIEW }.size
  end

  def viewed_by(user_id)
    video_movements.create!(user_id: user_id, action: VideoMovementAction::VIEW)
  end
end
