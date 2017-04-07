class Url < ApplicationRecord
  
  validates :original_url, url: true, presence: true, uniqueness: true, on: :create
  
  after_initialize :init
  
  def init
    self.visits ||= 0
  end
  
  def create_short_url(domain, id)
    self.short_url = "#{domain}/#{encode(id)}"
  end
  
  def create_short_code(id)
    self.short_code = encode(id)
  end
  
  # TODO extract out into a new visit model- allocreaws tracking dates of multiple visits
  def add_visit
    self.visits += 1
    self.date_last_visit = DateTime.now
  end
  
  private
  
  ALPHABET =
  "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
  
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
  
  # Currently unused- think about removing
  def decode(s)
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end
end
