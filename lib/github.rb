require 'rest-client'
require 'pry'
require 'json'

class Github

    def initialize(learnide_link)
        file = File.read('environment.json')
        @token = JSON.parse(file)["token"]
        @repo_name = get_repo_name(learnide_link)
        @new_repo_url = nil
    end

    def get_repo_name(learnide_link)
        learnide_link[24..-1]
    end

    def create_repo(name)
        payload = { name: name }
        headers = { params: {access_token: @token} }
        res = RestClient.post('https://api.github.com/user/repos', payload.to_json, headers)
    end
    
    def fork_repo
        # POST /repos/:owner/:repo/forks
        puts "Forking repo...."
        headers = { params: {access_token: @token} }
        res = RestClient.post("https://api.github.com/repos/learn-co-students/#{@repo_name}/forks", {}, headers)
        # res["owner"]["login"] == "mjroose"
        @new_repo_url = res["html_url"] #== "https://github.com/mjroose/sinatra-fwitter-group-project-cb-000"
        #res["parent"]["html_url"] == "https://github.com/learn-co-students/sinatra-fwitter-group-project-cb-000"
        binding.pry
    end

    def clone_repo(git_url)
        
    end
end