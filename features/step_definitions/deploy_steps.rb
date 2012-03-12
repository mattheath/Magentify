When /^I execute deploy$/ do
  Dir.chdir(@src_dir) do
    system "cap deploy:setup > /dev/null 2>&1"
    system "cap deploy > /dev/null 2>&1"
  end
end

Then /^the local\.xml file should be written to shared$/ do
  File.exists?(File.join(@test_files_dir, "deployed", "shared", "app", "etc", "local.xml")).should be_true
end

When /^I have deploy\.rb with missing config$/ do
  # Write a custom deploy file to the app, using an ERB template
  deploy_variables = {
    :deploy_to => File.join(@test_files_dir, "deployed"),
    :repository => @repo_dir,
    :git_executable => `which git`.strip,
    :logged_in_user => Etc.getlogin
  }

  template_path     = File.expand_path(File.join(__FILE__, "..", "..", "templates", "deploy-fail.erb"))
  compiled_template = ERB.new(File.read(template_path)).result(binding)

  File.open(File.join(@src_dir, "config", "deploy.rb"), 'w') {|f| 
    f.write compiled_template
  }
  Dir.chdir(@src_dir) do
    @out = %x[cap deploy 2>&1]
  end
end

Then /^\[error\] should be returned$/ do
  @out.match('Please').should be_true
end

When /^I execute mage:disable$/ do
  Dir.chdir(@src_dir) do
    @out = %x[cap mage:disable 2>&1]
  end
end

Then /^the maintenance\.flag file should be written to current$/ do
  File.exists?(File.join(@test_files_dir, "deployed", "current", "maintenance.flag")).should be_true
end

When /^I execute mage:enable$/ do
  Dir.chdir(@src_dir) do
    @out = %x[cap mage:enable 2>&1]
  end
end

Then /^the maintenance\.flag file should be removed from current$/ do
  File.exists?(File.join(@test_files_dir, "deployed", "current", "maintenance.flag")).should be_false
end