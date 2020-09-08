class VideoListComponent < ViewComponent::Base
  def initialize(videos:)
    @videos = videos
  end
end
