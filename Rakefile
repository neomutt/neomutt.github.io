require 'html-proofer'

task :test do
  sh "jekyll build"
  options = {
      :assume_extension => true,
      :alt_ignore => [ "*" ],

      # only in _site !
      :file_ignore => [ 
          "js/*",
          "images/*",
          "contrib/images/*",
          "fonts/*",
          "google*",
          "*.txt",
          "*.rc",
          "*.sh",
          "*.gv",
          "*.ico",
          "Rakefile",
          "sitemap.xml",
          "robots.txt"
      ],
      :checks_to_ignore => [
          "ImageCheck",
          "ScriptCheck"
      ],
      :cache => {
          :timeframe => '30d'
      },
      :only_4xx => true,
      :typhoeus => {
        :ssl_verifypeer => false,
        :ssl_verifyhost => 0
      }
  }
  HTMLProofer.check_directory("./_site", options).run
end
