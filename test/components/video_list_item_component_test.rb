require "test_helper"

class VideoListItemComponentTest < ViewComponent::TestCase
  include ActionDispatch::TestProcess

  setup do
    @video = videos(:sculpture_video)
    @video.update(
      video: fixture_file_upload('files/video.mp4', 'video/mp4'),
      thumbnail: fixture_file_upload('files/thumbnail.jpg', 'image/jpg')
    )
  end

  test "render video list item" do
    assert_equal(
      %(<div class=\"media-content\">
          <div class=\"content\">
            <h5 class=\"title is-5\">Building a sculpture with maple wood</h5>
            <p class=\"subtitle is-6\">Greatest Channel</p>
            <p class=\"subtitle is-6\"><i class=\"fas fa-eye mr-2\"></i> 0</p>
          </div>
        </div>).squish,
      render_inline(VideoListItemComponent.new(video: @video)).css(".media-content").to_html.squish
    )
  end
end
