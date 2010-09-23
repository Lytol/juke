require 'juke/api'

World(Juke::API)

When /^(?:|I )get ([^\s]+)$/ do |url|
  get(url)
end

When /^(?:|I )post ([^\s]+)$/ do |url|
  post(url)
end

When /^(?:|I )put ([^\s]+)$/ do |url|
  put(url)
end

When /^(?:|I )delete ([^\s]+)$/ do |url|
  delete(url)
end

When /^(?:|I )get (.+) with:$/ do |url,name_value_pairs|
  get(url, name_value_pairs.rows_hash)
end

When /^(?:|I )post (.+) with:$/ do |url,name_value_pairs|
  post(url, name_value_pairs.rows_hash)
end

When /^(?:|I )put (.+) with:$/ do |url,name_value_pairs|
  put(url, name_value_pairs.rows_hash)
end

When /^(?:|I )delete (.+) with:$/ do |url,name_value_pairs|
  delete(url, name_value_pairs.rows_hash)
end

Then /^(?:|response )should equal (.+)$/ do |object|
  response_body.should == eval(object)
end

Then /^status should be (\d{3})$/ do |status|
  response_status.should == status.to_i
end
