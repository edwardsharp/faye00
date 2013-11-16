class RealtimePController < FayeRails::Controller
  channel '/p' do
    subscribe do
      Rails.logger.debug "Received on #{channel}: #{inspect}"

      created_at = if message['created_at'] && message['created_at'].size > 0
                     Time.parse(message['created_at'])
                   else
                     Time.now
                   end

      PMessage.new(message['message'], created_at)
    end
  end
end
