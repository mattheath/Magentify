When /^I execute deploy$/ do
  Dir.chdir(@app_dir) do
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

  File.open(File.join(@app_dir, "config", "deploy.rb"), 'w') {|f| 
    f.write compiled_template
  }
end

Then /^\[error\] should be returned$/ do
  Dir.chdir(@app_dir) do
    result = %x[cap -T]
    result.match('error').should be_true
  end
end