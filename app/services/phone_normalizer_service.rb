class PhoneNormalizerService
  def call(args)
    arr = args.split(' ')
    arr.map do |elem|

      if string?(elem)
        elem
      else
        result = Numberplan.where(prefix: find_search_variants(elem).uniq).pluck(:prefix)
        if result.present?
          result.join(' ')
        else
          elem
        end
      end
    end.join(' ')
  end

  private

  def find_search_variants(str)
    (Numberplan.minimum(:prefix).to_s.length..Numberplan.maximum(:prefix).to_s.length).map { |length| trim_code(str)[0, length] }
  end

  def string?(str)
    str = str.gsub(/[\s\-\(\)]+/, '')
    str.gsub(/\D+/, '').length < str.gsub(/\d+/, '').length
  end

  def trim_code(elem)
    elem.sub(/^49[\s\-]?\(?0\)?[\s\-]?/, '').gsub(/^490?/, '').gsub(/^0/, '').gsub(/\D+/, '')
  end
end
