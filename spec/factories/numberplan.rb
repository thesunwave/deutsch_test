module Cranky
  class Factory

    def number
      Numberplan.new do |n|
        n.max_length = options[:max_length] || 11,
        n.min_length = options[:min_length] || 6,
        n.prefix = fetch(:prefix, 201),
        n.usage = 'Geographic Area Code',
        n.comment = options[:comment] || 'Essen'
      end
    end
  end
end
