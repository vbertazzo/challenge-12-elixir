defmodule Exgithub.Github.ClientTest do
  use ExUnit.Case, async: true
  alias Exgithub.Error
  alias Exgithub.Github.Client
  alias Plug.Conn

  describe "get_repos/2" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "returns the user repositories when username is valid", %{bypass: bypass} do
      username = "danilo-vieira"

      url = endpoint_url(bypass.port)

      body = ~s([
        {
          "id": 247000001,
          "node_id": "MDEwOlJlcG9zaXRvcnkyNDcwMDAwMDE=",
          "name": "audio_processing",
          "full_name": "danilo-vieira/audio_processing",
          "private": false,
          "owner": {
            "login": "danilo-vieira",
            "id": 20424197,
            "node_id": "MDQ6VXNlcjIwNDI0MTk3",
            "avatar_url": "https://avatars.githubusercontent.com/u/20424197?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/danilo-vieira",
            "html_url": "https://github.com/danilo-vieira",
            "followers_url": "https://api.github.com/users/danilo-vieira/followers",
            "following_url": "https://api.github.com/users/danilo-vieira/following{/other_user}",
            "gists_url": "https://api.github.com/users/danilo-vieira/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/danilo-vieira/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/danilo-vieira/subscriptions",
            "organizations_url": "https://api.github.com/users/danilo-vieira/orgs",
            "repos_url": "https://api.github.com/users/danilo-vieira/repos",
            "events_url": "https://api.github.com/users/danilo-vieira/events{/privacy}",
            "received_events_url": "https://api.github.com/users/danilo-vieira/received_events",
            "type": "User",
            "site_admin": false
          },
          "html_url": "https://github.com/danilo-vieira/audio_processing",
          "description": "Material necessário para realização do processamento de áudios para a disciplina Tópicos Especiais em Inteligência Artificial - UFPI",
          "fork": false,
          "url": "https://api.github.com/repos/danilo-vieira/audio_processing",
          "forks_url": "https://api.github.com/repos/danilo-vieira/audio_processing/forks",
          "keys_url": "https://api.github.com/repos/danilo-vieira/audio_processing/keys{/key_id}",
          "collaborators_url": "https://api.github.com/repos/danilo-vieira/audio_processing/collaborators{/collaborator}",
          "teams_url": "https://api.github.com/repos/danilo-vieira/audio_processing/teams",
          "hooks_url": "https://api.github.com/repos/danilo-vieira/audio_processing/hooks",
          "issue_events_url": "https://api.github.com/repos/danilo-vieira/audio_processing/issues/events{/number}",
          "events_url": "https://api.github.com/repos/danilo-vieira/audio_processing/events",
          "assignees_url": "https://api.github.com/repos/danilo-vieira/audio_processing/assignees{/user}",
          "branches_url": "https://api.github.com/repos/danilo-vieira/audio_processing/branches{/branch}",
          "tags_url": "https://api.github.com/repos/danilo-vieira/audio_processing/tags",
          "blobs_url": "https://api.github.com/repos/danilo-vieira/audio_processing/git/blobs{/sha}",
          "git_tags_url": "https://api.github.com/repos/danilo-vieira/audio_processing/git/tags{/sha}",
          "git_refs_url": "https://api.github.com/repos/danilo-vieira/audio_processing/git/refs{/sha}",
          "trees_url": "https://api.github.com/repos/danilo-vieira/audio_processing/git/trees{/sha}",
          "statuses_url": "https://api.github.com/repos/danilo-vieira/audio_processing/statuses/{sha}",
          "languages_url": "https://api.github.com/repos/danilo-vieira/audio_processing/languages",
          "stargazers_url": "https://api.github.com/repos/danilo-vieira/audio_processing/stargazers",
          "contributors_url": "https://api.github.com/repos/danilo-vieira/audio_processing/contributors",
          "subscribers_url": "https://api.github.com/repos/danilo-vieira/audio_processing/subscribers",
          "subscription_url": "https://api.github.com/repos/danilo-vieira/audio_processing/subscription",
          "commits_url": "https://api.github.com/repos/danilo-vieira/audio_processing/commits{/sha}",
          "git_commits_url": "https://api.github.com/repos/danilo-vieira/audio_processing/git/commits{/sha}",
          "comments_url": "https://api.github.com/repos/danilo-vieira/audio_processing/comments{/number}",
          "issue_comment_url": "https://api.github.com/repos/danilo-vieira/audio_processing/issues/comments{/number}",
          "contents_url": "https://api.github.com/repos/danilo-vieira/audio_processing/contents/{+path}",
          "compare_url": "https://api.github.com/repos/danilo-vieira/audio_processing/compare/{base}...{head}",
          "merges_url": "https://api.github.com/repos/danilo-vieira/audio_processing/merges",
          "archive_url": "https://api.github.com/repos/danilo-vieira/audio_processing/{archive_format}{/ref}",
          "downloads_url": "https://api.github.com/repos/danilo-vieira/audio_processing/downloads",
          "issues_url": "https://api.github.com/repos/danilo-vieira/audio_processing/issues{/number}",
          "pulls_url": "https://api.github.com/repos/danilo-vieira/audio_processing/pulls{/number}",
          "milestones_url": "https://api.github.com/repos/danilo-vieira/audio_processing/milestones{/number}",
          "notifications_url": "https://api.github.com/repos/danilo-vieira/audio_processing/notifications{?since,all,participating}",
          "labels_url": "https://api.github.com/repos/danilo-vieira/audio_processing/labels{/name}",
          "releases_url": "https://api.github.com/repos/danilo-vieira/audio_processing/releases{/id}",
          "deployments_url": "https://api.github.com/repos/danilo-vieira/audio_processing/deployments",
          "created_at": "2020-03-13T06:07:57Z",
          "updated_at": "2020-03-14T19:11:46Z",
          "pushed_at": "2020-03-13T06:09:57Z",
          "git_url": "git://github.com/danilo-vieira/audio_processing.git",
          "ssh_url": "git@github.com:danilo-vieira/audio_processing.git",
          "clone_url": "https://github.com/danilo-vieira/audio_processing.git",
          "svn_url": "https://github.com/danilo-vieira/audio_processing",
          "homepage": "",
          "size": 5,
          "stargazers_count": 0,
          "watchers_count": 0,
          "language": "Python",
          "has_issues": true,
          "has_projects": true,
          "has_downloads": true,
          "has_wiki": true,
          "has_pages": false,
          "forks_count": 0,
          "mirror_url": null,
          "archived": false,
          "disabled": false,
          "open_issues_count": 0,
          "license": {
            "key": "mit",
            "name": "MIT License",
            "spdx_id": "MIT",
            "url": "https://api.github.com/licenses/mit",
            "node_id": "MDc6TGljZW5zZTEz"
          },
          "allow_forking": true,
          "is_template": false,
          "topics": [],
          "visibility": "public",
          "forks": 0,
          "open_issues": 0,
          "watchers": 0,
          "default_branch": "master"
        }
      ])

      Bypass.expect(bypass, "GET", "#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = Client.get_repos(url, username)

      expected =
        {:ok,
         [
           %Exgithub.Github.Response{
             description:
               "Material necessário para realização do processamento de áudios para a disciplina Tópicos Especiais em Inteligência Artificial - UFPI",
             html_url: "https://github.com/danilo-vieira/audio_processing",
             id: 247_000_001,
             name: "audio_processing",
             stargazers_count: 0
           }
         ]}

      assert response == expected
    end

    test "returns an empty list when user has no repositories", %{bypass: bypass} do
      username = "testuser3"

      url = endpoint_url(bypass.port)

      body = ~s([])

      Bypass.expect(bypass, "GET", "#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = Client.get_repos(url, username)

      expected = {:ok, []}

      assert response == expected
    end

    test "returns an error when username was not found", %{bypass: bypass} do
      username = "inexistentuser123456789"

      url = endpoint_url(bypass.port)

      body = ~s({
        "message": "Not Found",
        "documentation_url": "https://docs.github.com/rest/reference/repos#list-repositories-for-a-user"
      })

      Bypass.expect(bypass, "GET", "#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(404, body)
      end)

      response = Client.get_repos(url, username)

      expected = {
        :error,
        %Error{result: "GitHub user not found", status: :not_found}
      }

      assert response == expected
    end

    test "returns an error when tehre is a generic error", %{bypass: bypass} do
      username = "danilo-vieira"

      url = endpoint_url(bypass.port)

      Bypass.down(bypass)

      response = Client.get_repos(url, username)

      expected = {:error, %Exgithub.Error{result: :econnrefused, status: :bad_request}}

      assert response == expected
    end

    defp endpoint_url(port), do: "http://localhost:#{port}/"
  end
end
