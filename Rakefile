require 'html-proofer'

options = {
    :assume_extension => true,
    :alt_ignore => [ /.*/ ],

    # only in _site !
    :file_ignore => [
        /.*js\/*/,
        /.*images\/*/,
        /.*contrib\/images\/*/,
        /.*fonts\/*/,
        /.*google*/,
        /.*code\/*/,
        /.*txt/,
        /.*rc/,
        /.*pl/,
        /.*pub/,
        /.*gv/,
        /.*sh/,
        /.*gv/,
        /.*ico/,
        /.*xml/,
        /Rakefile/,
    ],
    :log_level => :debug,
    :checks_to_ignore => [
        "ImageCheck",
        "ScriptCheck"
    ],
    :cache => {
        :timeframe => '12w',
        :storage_dir => ENV["HOME"] + "/.cache/htmlproofer"
    },
    :only_4xx => true,
    :typhoeus => {
        :ssl_verifypeer => false,
        :ssl_verifyhost => 0
    }
}

task :default do
    sh "jekyll build"
    sh "mkdir -p _site/code/; touch _site/code/index.html"
    HTMLProofer.check_directory("./_site/", options).run
end

