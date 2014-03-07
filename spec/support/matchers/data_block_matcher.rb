RSpec::Matchers.define :data_block do |name|

  match do |subject|
    have_xpath "//*[contains(@data-block, #{name})]"
  end

end