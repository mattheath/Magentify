When /^I execute mage:indexer$/ do
  Dir.chdir(@src_dir) do
    @out = %x[cap mage:indexer 2>&1]
  end
end

Then /^the Magento indexer should be executed$/ do
  @out.match('php -f indexer.php -- reindexall').should be_true
end