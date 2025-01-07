class DrawChannel < ApplicationCable::Channel
  def subscribed
    stream_from "draw_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def draw data
    puts "data: #{data}"
    ActionCable.server.broadcast "draw_channel", data
  end
end
