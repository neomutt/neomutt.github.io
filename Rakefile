require 'html-proofer'

task :test do
  sh "jekyll build"
  options = { 
      :assume_extension => true,
      :only_4xx => true,
      :typhoeus => {
        :ssl_verifypeer => false,
        :ssl_verifyhost => 0
      }
  }
  HTMLProofer.check_directory("./_site", options).run
end
