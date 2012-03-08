When /^I execute deploy:setup$/ do
  Dir.chdir(@app_dir) do
    system "cap deploy:setup > /dev/null"
  end
end

Then /^the shared folder structure should be created$/ do
  pending # express the regexp above with the code you wish you had
end