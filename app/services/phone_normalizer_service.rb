class PhoneNormalizerService
  def call(args)
    arr = args.split(' ')
    arr.map do |elem|
      begin
        if Numberplan.find_by_prefix(elem).present?
          elem
        else
          Phony.format(Phony.normalize(elem), format: :international).split[1]
        end
      rescue
        elem
      end
    end.join(' ')
  end
end
