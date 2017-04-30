require 'html-proofer'


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


# for every test
sh "jekyll build"

task :TestFeatures do
    print("\n")
    print("\n")
    puts("=====================================")
    print("\n")
    print("\n")
    puts("testing features..")

    HTMLProofer.check_directory("./_site/feature", options).run
    HTMLProofer.check_file("./_site/feature.html", options).run
end

task :TestGuide do
    print("\n")
    print("\n")
    puts("=====================================")
    print("\n")
    print("\n")
    puts("testing Guide..")

    HTMLProofer.check_directory("./_site/guide", options).run
end


task :TestDevel do
    print("\n")
    print("\n")
    puts("=====================================")
    print("\n")
    print("\n")
    puts("testing Devel..")

    HTMLProofer.check_directory("./_site/dev", options).run
    HTMLProofer.check_file("./_site/dev.html", options).run
end


