class ChannelStatus < BaseEnum
  associate_values(
    :active,
    :hidden,
    :deactive
  )
end
