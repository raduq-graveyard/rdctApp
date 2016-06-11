class FilterEnum
  #Commons
  EQUALS = CommonEquals.new

  #Numeric
  LESSER = NumericLesser.new
  LESSER_EQUALS = NumericLesserEquals.new
  GREATER = NumericGreater.new
  GREATER_EQUALS = NumericGreaterEquals.new

  #String
  LIKE = Stringlike.new
  STARTS_WITH = StringStartsWith.new
  ENDS_WITH = StringEndsWith.new
  EQUALS = CommonEquals.new

  def find_operator(name)
    const_get(name.to_s.upcase).class_eval
  end

end