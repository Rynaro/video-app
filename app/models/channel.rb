class Channel < ApplicationRecord
  extend FriendlyId

  has_enumeration_for :status, with: ChannelStatus,
                               create_scopes: true,
                               create_helpers: true,
                               required: true

  attribute :status, :string, default: ChannelStatus::ACTIVE

  belongs_to :user
  has_many :videos

  friendly_id :title, use: :slugged
end
