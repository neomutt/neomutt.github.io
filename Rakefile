require 'html-proofer'

task :test do
  sh "jekyll build"
  options = { 
      :assume_extension => true,
      :empty_alt_ignore => true,
      :cache => { :timeframe => '30d' },
      :only_4xx => true,
      :typhoeus => {
        :ssl_verifypeer => false,
        :ssl_verifyhost => 0
      }
  }
  HTMLProofer.check_directory("./_site", options).run
end
