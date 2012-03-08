When /^I execute magentify \.$/ do
  Dir.chdir(@app_dir) do
    system "magentify . > /dev/null 2>&1"
  end
end

Then /^Capfile should load mage\.rb$/ do
  File.open(File.join(@app_dir, "Capfile"), 'rb').read().match('mage\.rb').should be_true
end

When /^I execute cap \-T$/ do
  Dir.chdir(@app_dir) do
    system "cap -T > /dev/null 2>&1"
  end
end

Then /^mage tasks should be listed$/ do
  Dir.chdir(@app_dir) do
    result = %x[cap -T]
    result.match('Clear the Magento Cache').should be_true
  end
end