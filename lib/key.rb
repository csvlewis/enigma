class Key
  attr_reader :key,
              :subkey_a,
              :subkey_b,
              :subkey_c,
              :subkey_d
  def initialize(key)
    @key = key
    @subkey_a = (key[0] + key[1]).to_i
    @subkey_b = (key[1] + key[2]).to_i
    @subkey_c = (key[2] + key[3]).to_i
    @subkey_d = (key[3] + key[4]).to_i
  end
end
