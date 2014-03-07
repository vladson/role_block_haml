Rspec::Matchers.define :data_block do |name|

  match do |subject|
    subject.have_selector('data-block' => name)
  end

end