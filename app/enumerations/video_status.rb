class VideoStatus < BaseEnum
  associate_values(
    :active,
    :hidden,
    :deactive
  )
end
