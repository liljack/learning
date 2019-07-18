class Marker

  def initialize(secret, guess)
    @secret, @guess = secret, guess
  end

  def number_match_count
    total_match_count - exact_match_count
  end

  def total_match_count
    secret = @secret.split('')
    @guess.split('').inject(0) do |count, n|
      if secret.include?(n)
        delete_first(secret, n)
        count + 1
      else
        count + 0
      end
    end
  end

  def delete_first(code,n)
    code.delete_at(code.index(n))
  end

  def exact_match_count
    (0..3).inject(0) do |count, index|
      count + (exact_match?(index) ? 1 : 0)
    end
  end

  def exact_match?(index)
    @guess[index] == @secret[index]
  end

  def number_match?(index)
    @secret.include?(@guess[index])  && !exact_match?(index)
  end
end
