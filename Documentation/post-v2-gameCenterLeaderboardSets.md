<!--
{
  "availability" : [

  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v2-gameCenterLeaderboardSets",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v2-gameCenterLeaderboardSets"
  },
  "title" : "Create a Game Center Leaderboard Set"
}
-->

# Create a Game Center Leaderboard Set

Create a Game Center leaderboard set.

## Overview

- 201:
- 400:
- 401:
- 403:
- 409:
- 422:
- 429:

### Discussion

Create a leaderboard set with a relationship to one of the following:

- `gameCenterDetail`
- `gameCenterGroup`
- `gameCenterLeaderboards`

If you create a leaderboard set with `gameCenterLeaderboards`, any leaderboards you attach are in the same app. If you create a leaderboard set with `gameCenterGroup`, any leaderboards you attach are in the same group.

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)