class StringEndsWith

  def query(filter)
    filter.query + ' LIKE :like_name'
  end

  def value(filter)
    like_value = filter.value
    {:like_name => "%#{like_value}" }
  end
end