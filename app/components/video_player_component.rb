class VideoPlayerComponent < ViewComponent::Base
  def initialize(video:)
    @video = video
  end

  def video_url
    rails_blob_path(stored_video)
  end

  def content_type
    stored_video.content_type
  end

  def video_hash_id
    video.hashid
  end

  private

  attr_reader :video

  def stored_video
    video.video
  end
end
