class PController < ApplicationController
  def index
    @p_messages = PMessage.find
  end
end
