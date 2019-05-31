class Address

  attr_accessor :kind, :street_1, :street_2, :city, :state, :postal_code

  def to_s(format = 'short')
    address = ''
    csp = "#{city}, #{state}, #{postal_code}"

    case format
    when 'short'
      address += "#{kind}: #{street_1}#{ street_2 if !street_2.nil?}, #{csp}"
    when 'long'
      address += "#{street_1}\n#{street_2 + '\n' if !street_2.nil?}#{csp}"
    end
  
    address
  end

end