module Cranky
  class Factory

    def number
      Numberplan.new do |n|
        n.prefix = 201,
        n.max_length = 11,
        n.min_length = 6,
        n.usage = 'Geographic Area Code',
        n.comment = 'Essen'
      end
    end
  end
end
