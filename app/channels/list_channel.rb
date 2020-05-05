class ListChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ListChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
