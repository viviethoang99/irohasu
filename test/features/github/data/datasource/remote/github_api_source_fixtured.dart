import 'dart:convert';

final latest = jsonDecode('''
{
  "url": "https://api.github.com/repos/viviethoang99/irohasu/releases/64582151",
  "assets_url": "https://api.github.com/repos/viviethoang99/irohasu/releases/64582151/assets",
  "upload_url": "https://uploads.github.com/repos/viviethoang99/irohasu/releases/64582151/assets{?name,label}",
  "html_url": "https://github.com/viviethoang99/irohasu/releases/tag/0.0.1",
  "id": 64582151,
  "author": {
    "login": "viviethoang99",
    "id": 46831689,
    "node_id": "MDQ6VXNlcjQ2ODMxNjg5",
    "avatar_url": "https://avatars.githubusercontent.com/u/46831689?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/viviethoang99",
    "html_url": "https://github.com/viviethoang99",
    "followers_url": "https://api.github.com/users/viviethoang99/followers",
    "following_url": "https://api.github.com/users/viviethoang99/following{/other_user}",
    "gists_url": "https://api.github.com/users/viviethoang99/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/viviethoang99/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/viviethoang99/subscriptions",
    "organizations_url": "https://api.github.com/users/viviethoang99/orgs",
    "repos_url": "https://api.github.com/users/viviethoang99/repos",
    "events_url": "https://api.github.com/users/viviethoang99/events{/privacy}",
    "received_events_url": "https://api.github.com/users/viviethoang99/received_events",
    "type": "User",
    "site_admin": false
  },
  "node_id": "RE_kwDOE1PGmc4D2XIH",
  "tag_name": "0.0.1",
  "target_commitish": "main",
  "name": "0.0.1",
  "draft": false,
  "prerelease": false,
  "created_at": "2021-10-08T07:40:22Z",
  "published_at": "2022-04-16T13:52:13Z",
  "assets": [
    {
      "url": "https://api.github.com/repos/viviethoang99/irohasu/releases/assets/62759152",
      "id": 62759152,
      "node_id": "RA_kwDOE1PGmc4DvaDw",
      "name": "Irohasu.apk",
      "label": null,
      "uploader": {
        "login": "viviethoang99",
        "id": 46831689,
        "node_id": "MDQ6VXNlcjQ2ODMxNjg5",
        "avatar_url": "https://avatars.githubusercontent.com/u/46831689?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/viviethoang99",
        "html_url": "https://github.com/viviethoang99",
        "followers_url": "https://api.github.com/users/viviethoang99/followers",
        "following_url": "https://api.github.com/users/viviethoang99/following{/other_user}",
        "gists_url": "https://api.github.com/users/viviethoang99/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/viviethoang99/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/viviethoang99/subscriptions",
        "organizations_url": "https://api.github.com/users/viviethoang99/orgs",
        "repos_url": "https://api.github.com/users/viviethoang99/repos",
        "events_url": "https://api.github.com/users/viviethoang99/events{/privacy}",
        "received_events_url": "https://api.github.com/users/viviethoang99/received_events",
        "type": "User",
        "site_admin": false
      },
      "content_type": "application/vnd.android.package-archive",
      "state": "uploaded",
      "size": 21997018,
      "download_count": 20,
      "created_at": "2022-04-16T13:42:09Z",
      "updated_at": "2022-04-16T13:52:13Z",
      "browser_download_url": "https://github.com/viviethoang99/irohasu/releases/download/0.0.1/Irohasu.apk"
    }
  ],
  "tarball_url": "https://api.github.com/repos/viviethoang99/irohasu/tarball/0.0.1",
  "zipball_url": "https://api.github.com/repos/viviethoang99/irohasu/zipball/0.0.1",
  "body": "Happy birthday Iroha."
}
''');

final notFoundResponse = jsonDecode('''
{
    "message": "Url not found",
    "error": 15
}
''');

final listApp = jsonDecode('''
[
  {
    "url": "https://api.github.com/repos/viviethoang99/irohasu/releases/64582151",
    "assets_url": "https://api.github.com/repos/viviethoang99/irohasu/releases/64582151/assets",
    "upload_url": "https://uploads.github.com/repos/viviethoang99/irohasu/releases/64582151/assets{?name,label}",
    "html_url": "https://github.com/viviethoang99/irohasu/releases/tag/0.0.1",
    "id": 64582151,
    "author": {
      "login": "viviethoang99",
      "id": 46831689,
      "node_id": "MDQ6VXNlcjQ2ODMxNjg5",
      "avatar_url": "https://avatars.githubusercontent.com/u/46831689?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/viviethoang99",
      "html_url": "https://github.com/viviethoang99",
      "followers_url": "https://api.github.com/users/viviethoang99/followers",
      "following_url": "https://api.github.com/users/viviethoang99/following{/other_user}",
      "gists_url": "https://api.github.com/users/viviethoang99/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/viviethoang99/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/viviethoang99/subscriptions",
      "organizations_url": "https://api.github.com/users/viviethoang99/orgs",
      "repos_url": "https://api.github.com/users/viviethoang99/repos",
      "events_url": "https://api.github.com/users/viviethoang99/events{/privacy}",
      "received_events_url": "https://api.github.com/users/viviethoang99/received_events",
      "type": "User",
      "site_admin": false
    },
    "node_id": "RE_kwDOE1PGmc4D2XIH",
    "tag_name": "0.0.1",
    "target_commitish": "main",
    "name": "0.0.1",
    "draft": false,
    "prerelease": false,
    "created_at": "2021-10-08T07:40:22Z",
    "published_at": "2022-04-16T13:52:13Z",
    "assets": [
      {
        "url": "https://api.github.com/repos/viviethoang99/irohasu/releases/assets/62759152",
        "id": 62759152,
        "node_id": "RA_kwDOE1PGmc4DvaDw",
        "name": "Irohasu.apk",
        "label": null,
        "uploader": {
          "login": "viviethoang99",
          "id": 46831689,
          "node_id": "MDQ6VXNlcjQ2ODMxNjg5",
          "avatar_url": "https://avatars.githubusercontent.com/u/46831689?v=4",
          "gravatar_id": "",
          "url": "https://api.github.com/users/viviethoang99",
          "html_url": "https://github.com/viviethoang99",
          "followers_url": "https://api.github.com/users/viviethoang99/followers",
          "following_url": "https://api.github.com/users/viviethoang99/following{/other_user}",
          "gists_url": "https://api.github.com/users/viviethoang99/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/viviethoang99/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/viviethoang99/subscriptions",
          "organizations_url": "https://api.github.com/users/viviethoang99/orgs",
          "repos_url": "https://api.github.com/users/viviethoang99/repos",
          "events_url": "https://api.github.com/users/viviethoang99/events{/privacy}",
          "received_events_url": "https://api.github.com/users/viviethoang99/received_events",
          "type": "User",
          "site_admin": false
        },
        "content_type": "application/vnd.android.package-archive",
        "state": "uploaded",
        "size": 21997018,
        "download_count": 20,
        "created_at": "2022-04-16T13:42:09Z",
        "updated_at": "2022-04-16T13:52:13Z",
        "browser_download_url": "https://github.com/viviethoang99/irohasu/releases/download/0.0.1/Irohasu.apk"
      }
    ],
    "tarball_url": "https://api.github.com/repos/viviethoang99/irohasu/tarball/0.0.1",
    "zipball_url": "https://api.github.com/repos/viviethoang99/irohasu/zipball/0.0.1",
    "body": "Happy birthday Iroha."
  }
]
''');
