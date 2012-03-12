When /^I execute deploy:setup$/ do
  Dir.chdir(@src_dir) do
    system "cap deploy:setup > /dev/null 2>&1"
  end
end

Then /^the shared folder structure should be created$/ do
  pending # express the regexp above with the code you wish you had
end