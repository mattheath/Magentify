When /^I execute deploy with \-\-set compile=true$/ do
  Dir.chdir(@src_dir) do
    @out = %x[cap deploy --set compile=true 2>&1]
  end
end

Then /^the Magento compiler should be executed$/ do
  @out.match('php -f compiler.php -- compile').should be_true
end

When /^I execute deploy with \-\-set compile=false$/ do
  Dir.chdir(@src_dir) do
    @out = %x[cap deploy --set compile=false 2>&1]
  end
end

Then /^the Magento compiler should not be executed$/ do
  @out.match('php -f compiler.php -- compile').should be_false
end

When /^I execute mage:enable_compiler$/ do
  Dir.chdir(@src_dir) do
    @out = %x[cap mage:enable_compiler 2>&1]
  end
end

Then /^the Magento compiler should be executed with enable option$/ do
  @out.match('php -f compiler.php -- enable').should be_true
end

When /^I execute mage:disable_compiler$/ do
  Dir.chdir(@src_dir) do
    @out = %x[cap mage:disable_compiler 2>&1]
  end
end

Then /^the Magento compiler should be executed with disable option$/ do
  @out.match('php -f compiler.php -- disable').should be_true
end
