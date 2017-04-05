class Url < ApplicationRecord
  
  validates :original_url, url: true, presence: true, uniqueness: true, on: :create
  
  # after_save :create_short_url
  
  ALPHABET =
  "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
  
  def create_short_url(domain, id)
    self.short_url = "#{domain}/#{self.encode(id)}"
  end
  
  def create_short_code(id)
    self.short_code = self.encode(id)
  end
    
  def encode(i)
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
      while i > 0
        s << ALPHABET[i.modulo(base)]
        i /= base
      end
    s.reverse
  end
  
  def decode(s)
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end
  
end
