#!/usr/bin/env ruby
require_relative './lib/github.rb'

learn_ide_link = ARGV[0]

gh = Github.new(learn_ide_link)
gh.fork_repo
gh.clone_repo
gh.launch_code

# clone repo to local folder
# launch VSCode to open local folder