# inject custom methods into Ruby Symbol Class

class Symbol # :nodoc:
  # Localizes the symbol into the current locale. 
  # If there is no translation available, the replacement string will be returned
  def localize(replacement_string = '__i18n_missing__', args={})
    I18n.translate(self, {:default => "#{replacement_string}(#{self})"}.merge(args))
  end
  alias :l :localize

  def l_in(locale, args={})
    I18n.translate(self, {:locale => locale, :default => "_i18n_missing_(#{self})"}.merge(args)) unless locale.nil?
  end

  # Note that this method takes the replacement string after the args hash unlike other Globalite methods
  def localize_with_args(args={}, replacement_string = '__i18n_missing__')    
    I18n.translate(self, {:default => "#{replacement_string}(#{self})"}.merge(args))
  end
  alias :l_with_args :localize_with_args

end
