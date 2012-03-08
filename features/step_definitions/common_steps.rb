Given /^an app$/ do
  # Create the git repo
  FileUtils.mkdir_p @repo_dir
  Dir.chdir(@repo_dir) do
    system "git --bare init > /dev/null 2>&1"
  end

  # Create and capify the dummy app, and push it to the local repo
  FileUtils.mkdir_p @app_dir
  Dir.chdir(@app_dir) do
    [
      %Q{git init > /dev/null 2>&1} ,
      %Q{mkdir config > /dev/null 2>&1},
      %Q{magentify . > /dev/null 2>&1},
      %Q{git add . > /dev/null 2>&1},
      %Q{git commit -m "first commit" > /dev/null 2>&1},
      %Q{git remote add origin file://#{@repo_dir} > /dev/null 2>&1},
      %Q{git push origin master > /dev/null 2>&1}
    ].each do |command|
      system command
    end
  end

  # Write a custom deploy file to the app, using an ERB template
  deploy_variables = {
    :deploy_to => File.join(@test_files_dir, "deployed"),
    :repository => @repo_dir,
    :git_executable => `which git`.strip,
    :logged_in_user => Etc.getlogin
  }

  template_path     = File.expand_path(File.join(__FILE__, "..", "..", "templates", "deploy.erb"))
  compiled_template = ERB.new(File.read(template_path)).result(binding)

  File.open(File.join(@app_dir, "config", "deploy.rb"), 'w') {|f| 
    f.write compiled_template
  }
end
