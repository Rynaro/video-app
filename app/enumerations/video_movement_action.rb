class VideoMovementAction < BaseEnum
  associate_values(
    :view,
    :upvote,
    :downvote
  )
end
