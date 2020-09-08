require 'test_helper'

class Discover::VideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @video = videos(:sculpture_video)
    @video.update(
      video: fixture_file_upload('files/video.mp4', 'video/mp4'),
      thumbnail: fixture_file_upload('files/thumbnail.jpg', 'image/jpg')
    )
  end

  test "should index videos" do
    sign_in users(:greattuber)

    get discover_videos_url
    assert_response :success
  end

  test "should show video" do
    sign_in users(:greattuber)

    get discover_video_url(@video)
    assert_response :success
  end

  test "should add video view" do
    sign_in users(:greattuber)

    assert_difference('Video.first.views', 1) do
      post add_video_view_discover_video_url(@video)
    end

    assert_response :success
  end
end
