class NumericLesser
  def query(filter)
    filter.query + ' < :eq_name'
  end

  def value(filter)
    eq_value = filter.value
    {:eq_name => "#{eq_value}" }
  end
end