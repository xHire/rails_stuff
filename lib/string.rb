# Extensions of Ruby core class String
class String
  # Converts string to another one which is suitable for use in URL
  def seolize
    self.mb_chars.downcase.mb_chars.normalize(:kd).gsub(/[\s_.]+/, '-').gsub(/-+/, '-').gsub(/[^-a-z0-9~;+=_]/, '').gsub(/^-/, '').gsub(/-$/, '')
  end

  # Includes +normalize+ method from +ActiveSupport+ because of Ruby 1.9
  def normalize form = ActiveSupport::Multibyte.default_normalization_form
    ActiveSupport::Multibyte::Chars.new(self).normalize form
  end
end
