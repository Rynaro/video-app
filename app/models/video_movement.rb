class VideoMovement < ApplicationRecord
  has_enumeration_for :action, with: VideoMovementAction,
                               create_scopes: true,
                               create_helpers: true,
                               required: true

  attribute :action, :string

  belongs_to :user
  belongs_to :video
end
