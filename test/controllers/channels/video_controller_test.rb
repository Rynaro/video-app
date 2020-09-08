require 'test_helper'

class Channels::VideoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @video = videos(:sculpture_video)
  end

  test "should get new" do
    sign_in users(:greattuber)

    get new_channel_video_url(@video.channel)
    assert_response :success
  end

  test "should create video" do
    sign_in users(:greattuber)

    thumbnail = fixture_file_upload('files/thumbnail.jpg', 'image/jpg')
    video = fixture_file_upload('files/video.mp4', 'video/mp4')
    assert_difference('Video.count') do
      post channel_videos_url(@video.channel), params: {
        video: {
          channel_id: @video.channel_id,
          status: @video.status,
          title: @video.title,
          thumbnail: thumbnail,
          video: video
        }
      }
    end

    assert_redirected_to my_channel_url
  end

  test "should show video" do
    sign_in users(:greattuber)

    get channel_video_url(@video.channel, @video)
    assert_response :success
  end

  test "should update video" do
    sign_in users(:greattuber)

    patch channel_video_url(@video.channel, @video), params: { video: { channel_id: @video.channel_id, status: @video.status, title: @video.title } }
    assert_redirected_to my_channel_url
  end

  test "should destroy video" do
    sign_in users(:greattuber)

    assert_difference('Video.count', -1) do
      delete channel_video_url(@video.channel, @video)
    end

    assert_redirected_to my_channel_url
  end
end
