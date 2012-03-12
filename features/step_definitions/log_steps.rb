When /^I execute mage:clean_log$/ do
  Dir.chdir(@src_dir) do
    @out = %x[cap mage:clean_log 2>&1]
  end
end

Then /^the Magento log should be executed$/ do
  @out.match('php -f log.php -- clean').should be_true
end