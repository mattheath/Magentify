When /^I execute magentify \.$/ do
  Dir.chdir(@app_dir) do
    system "magentify . > /dev/null 2>&1"
  end
end

Then /^deploy\.rb should load mage\.rb$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I execute cap \-T$/ do
  Dir.chdir(@app_dir) do
    system "cap -T > /dev/null 2>&1"
  end
end

Then /^cap \-T should list mage$/ do
  pending # express the regexp above with the code you wish you had
end