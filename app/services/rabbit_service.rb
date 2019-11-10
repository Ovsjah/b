class RabbitService
  class << self
    def start(queue_name)
      @queue_name = queue_name
      subscribe_to_queue
    end

    private

      def queue
        @queue ||= channel.queue(@queue_name)
      end

      def xchange
        @xchange ||= channel.default_exchange
      end

      def channel
        @channel ||= connection.create_channel
      end

      def connection
        @connection ||= Bunny.new.tap(&:start)
      end

      def subscribe_to_queue
        queue.subscribe do |_delivery_info, properties, item_name|
          xchange.publish(
            CalcService.calc_cost(item_name),
            routing_key: properties.reply_to,
            correlation_id: properties.correlation_id
          )
        end
      end
  end
end
