require "test_helper"

class VideoPlayerComponentTest < ViewComponent::TestCase
  include ActionDispatch::TestProcess

  setup do
    @video = videos(:sculpture_video)
    @video.update(
      video: fixture_file_upload('files/video.mp4', 'video/mp4'),
      thumbnail: fixture_file_upload('files/thumbnail.jpg', 'image/jpg')
    )
  end

  test "renders video player" do
    assert_equal(1,  render_inline(VideoPlayerComponent.new(video: @video)).search(".video-js").size)
  end
end
