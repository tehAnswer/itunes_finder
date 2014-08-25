# Monkey patchin'
class Array
  def odd_values
    self.values_at(* self.each_index.select {|i| i.odd?})
  end
  def even_values
    self.values_at(* self.each_index.select {|i| i.even?})
  end

  def clip(n= 1)
    take size - n
  end
end