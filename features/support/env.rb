# require 'spec'
require 'erb'
require 'etc'

Before do
  @test_files_dir = File.join(Dir.pwd, "_files")
  @src_dir  = File.join(@test_files_dir, "src")
  @repo_dir = File.join(@test_files_dir, "repo")

  FileUtils.rm_r(@test_files_dir) if File.exists?(@test_files_dir)
  FileUtils.mkdir_p(@test_files_dir)
  # Iinstall the latest version of the gem
  system "gem uninstall magenify --version '>= 0' --executables --force > /dev/null 2>&1"
  system "rake build > /dev/null 2>&1"
  system "rake install > /dev/null 2>&1"
end