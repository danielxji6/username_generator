# Make sure to run the tests in your /spec folder
# Run `rspec /spec/username_spec.rb` to get started.

def format_name(first, last)
  first.empty? || last.empty? ? nil :
  (first.gsub(/[^A-z]/, "")[0] + last.gsub(/[^A-z]/, "")).downcase
end

def format_year(year)
  year.to_s.size != 4 ? nil : year.to_s[-2..-1]
end

def check_privilege(index = 0)
  case index.floor
  when 0
    'user'
  when 1
    'seller'
  when 2
    'manager'
  else
    'admin'
  end
end

def user_type_prefix(index)
  index == 0 ? "" : check_privilege(index) + "-"
end

def build_username(first, last, year, index = 0)
  user_type_prefix(index) + format_name(first, last) + format_year(year)
end

$user_list = {}

def generate_username(first, last, year, index = 0)
  user = build_username(first, last, year, index)
  if $user_list[user].nil?
    $user_list[user] = 0
    user
  else
    $user_list[user] += 1
    user + "_" + $user_list[user].to_s
  end
end
