module UsersHelper
  def random_hex
    hex = "#"
    6.times do
      hex += [("a".."f").to_a, ("0".."9").to_a].sample.sample
    end
    hex
  end
end
