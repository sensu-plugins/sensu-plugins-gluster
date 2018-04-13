module CommonGluster
  def print_hash(hash, path = '')
    hash.each do |key, value|
      new_path = "#{path}.#{key}"
      if value.is_a? Hash
        print_hash(value, new_path)
      else
        output "#{config[:scheme]}#{new_path}", value unless value.nil? || value.empty?
      end
    end
    false
  end

  def array_to_naming_hash(array, key_name, filter_keys = nil)
    array.map do |item|
      filtered_hash = if filter_keys.nil?
                        item
                      else
                        item.select { |key, _| filter_keys.include? key }
                      end
      [item.delete(key_name), filtered_hash]
    end.to_h
  end
end
