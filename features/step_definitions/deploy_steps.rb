When /^I execute deploy$/ do
  Dir.chdir(@app_dir) do
    system "cap deploy:setup > /dev/null"
    system "cap deploy > /dev/null"
  end
end

Then /^the PEOPLE_LIKE_YOU file should be written to shared$/ do
  File.exists?(File.join(@test_files_dir, "deployed", "shared", "PEOPLE_LIKE_YOU")).should be_true
end