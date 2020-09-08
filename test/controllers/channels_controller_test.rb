require 'test_helper'

class ChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @channel = channels(:my_channel)
  end

  test "should get new" do
    sign_in users(:greattuber)

    get new_channel_url
    assert_response :success
  end

  test "should create channel" do
    sign_in users(:greattuber)

    assert_difference('Channel.count') do
      post channels_url, params: { channel: { user_id: @channel.user_id, status: @channel.status, title: @channel.title } }
    end

    assert_redirected_to channel_url(Channel.last)
  end

  test "should show my channel after created one" do
    sign_in users(:greattuber)

    get my_channel_url
    assert_response :success
  end

  test "should redirect to new channel" do
    sign_in users(:newbietuber)

    get my_channel_url
    assert_redirected_to new_channel_url
  end
end
