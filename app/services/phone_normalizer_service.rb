class PhoneNormalizerService
  def call(args)
    arr = args.split(' ')
    arr.map do |elem|
        next prefix_by_phony(elem) if Phony.plausible?(elem)
        trimmed_str = strip_zero_by_start_string(elem)
        objs = Numberplan.where(prefix: scan_prefix(trimmed_str)).pluck(:prefix)

        if objs.present?
          next trimmed_str if objs.include?(0)
          objs.join(' ')
        else
          trimmed_str
        end

    end.join(' ')
  end

  private

  def scan_prefix(elem)
    return elem if elem.length < 3
    [elem, *scan_prefix(elem[0..-2])]
  end

  def prefix_by_phony(elem)
    Phony.format(Phony.normalize(elem), format: :international).split[1]
  end

  def strip_zero_by_start_string(elem)
    elem.gsub(/^0/, '')
  end
end
