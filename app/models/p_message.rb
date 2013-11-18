class PMessage
  HISTORY = 1

  attr_accessor :message, :created_at

  def initialize(message, created_at=Time.now)
    @message = message
    @created_at = created_at
    self.class.push self
  end

  def self.push(p_message)
    @p_messages ||= []
    @p_messages << p_message
    @p_messages = @p_messages.reverse.take(HISTORY).reverse
  end

  def self.find
    @p_messages ||= []
  end
end
