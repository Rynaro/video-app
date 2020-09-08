class VideoStatsButtonComponent < ViewComponent::Base
  ICONS = {
    views: "fa-eye",
    upvote: "fa-thumbs-up",
    downvote: "fa-thumbs-down"
  }.freeze

  COLORS = {
    views: "is-info",
    upvote: "is-success",
    downvote: "is-danger"
  }.freeze

  def initialize(type:, countage:)
    @type = type
    @countage = countage
  end

  def color
    COLORS[type]
  end

  def icon
    ICONS[type]
  end

  private

  attr_reader :type
end
