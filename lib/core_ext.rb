class String
  # NOTE: the params length is chinese length(eg: )
  # truncate('中国人民chinese',5) => 中国人民ch...
  def truncate(len,postfix='...')
    l=0
    char_array=self.unpack("U*")
    char_array.each_with_index do |c,i|
      l = l+ (c<127 ? 0.5 : 1)
      if l>=len
        return char_array[0..i].pack("U*")+(i<char_array.length-1 ? postfix : "")
      end
    end
    return self
  end

end
