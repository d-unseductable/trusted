module Trusted
  module Config
    class Builder
      attr_reader :config

      DEFAULT_CONFIG = {
        binding_type: :tcp,
        listen_on: 'localhost:3000',
        rack_thread_pool_size: 1,
        native_thread_pool_size: 1,
      }.freeze

      def self.dsl(&block)
        Docile.dsl_eval(new, &block).build
      end

      def initialize
        @config = {}
      end

      def binding_type(type)
        config[:binding_type] = type
      end

      def listen_on(address)
        config[:listen_on] = address
      end

      def rack_thread_pool_size(size)
        config[:rack_thread_pool_size] = size
      end

      def native_thread_pool_size(size)
        config[:native_thread_pool_size] = size
      end

      def build
        configuration = DEFAULT_CONFIG.merge(config)

        Config.new(configuration)
      end
    end
  end
end
