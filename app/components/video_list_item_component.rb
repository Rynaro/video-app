class VideoListItemComponent < ViewComponent::Base
  def initialize(video:)
    @video = video
  end

  def thumbnail
    rails_blob_path(video.thumbnail)
  end

  def title
    video.title
  end

  def author
    video.channel.title
  end

  def views
    video.views
  end

  private

  attr_reader :video
end
