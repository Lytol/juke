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

Then /^(?:|response )should have (.+)$/ do |obj|
  response_body.should include obj
end

Then /^(?:|response )should include hash:$/ do |name_value_pairs|
  name_value_pairs.rows_hash.each do |key, value|
    response_body.should have_key(key)
    response_body[key].should == value
  end
end

Then /^status should be (\d{3})$/ do |status|
  response_status.should == status.to_i
end
