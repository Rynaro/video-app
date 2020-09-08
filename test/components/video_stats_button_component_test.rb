require "test_helper"

class VideoStatsButtonComponentTest < ViewComponent::TestCase
  test "render views" do
    assert_equal(
      %(<span class=\"tag is-info is-medium is-pulled-right ml-1\">
          <i class=\"fas fa-eye mr-2\"></i>
          10
        </span>).squish,
      render_inline(VideoStatsButtonComponent.new(type: :views, countage: 10)).css("span").to_html.squish
    )
  end

  test "render upvote" do
    assert_equal(
      %(<span class=\"tag is-success is-medium is-pulled-right ml-1\">
          <i class=\"fas fa-thumbs-up mr-2\"></i>
          10
        </span>).squish,
      render_inline(VideoStatsButtonComponent.new(type: :upvote, countage: 10)).css("span").to_html.squish
    )
  end

  test "render downvote" do
    assert_equal(
      %(<span class=\"tag is-danger is-medium is-pulled-right ml-1\">
          <i class=\"fas fa-thumbs-down mr-2\"></i>
          10
        </span>).squish,
      render_inline(VideoStatsButtonComponent.new(type: :downvote, countage: 10)).css("span").to_html.squish
    )
  end
end
