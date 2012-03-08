When /^I execute deploy$/ do
  Dir.chdir(@app_dir) do
    system "cap deploy:setup > /dev/null 2>&1"
    system "cap deploy > /dev/null 2>&1"
  end
end

Then /^the PEOPLE_LIKE_YOU file should be written to shared$/ do
  File.exists?(File.join(@test_files_dir, "deployed", "shared", "PEOPLE_LIKE_YOU")).should be_true
end

When /^I execute deploy with missing config$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^\[error\] should be returned$/ do
  pending # express the regexp above with the code you wish you had
end