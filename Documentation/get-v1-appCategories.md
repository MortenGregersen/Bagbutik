<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appCategories",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appCategories"
  },
  "title" : "List app categories"
}
-->

# List app categories

List all categories on the App Store, including the category and subcategory hierarchy.

## Discussion

Use this endpoint to retrieve the list of available App Store categories and subcategories. Associate an app with categories using the [`Modify an app info`](/documentation/AppStoreConnectAPI/PATCH-v1-appInfos-_id_) endpoint.

The first example retrieves the full category and subcategory hierarchy in one request. The second example retrieves just the top-level categories for macOS apps.

### Get All App Categories and Subcategories

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/appCategories?include=parent&limit=100
```

**Response:**

```json
{
  "data" : [ {
    "type" : "appCategories",
    "id" : "STICKERS_EMOJI_AND_EXPRESSIONS",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_EMOJI_AND_EXPRESSIONS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_EMOJI_AND_EXPRESSIONS/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_EMOJI_AND_EXPRESSIONS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_EMOJI_AND_EXPRESSIONS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_EMOJI_AND_EXPRESSIONS"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_ACTION",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ACTION/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ACTION/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ACTION/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ACTION/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ACTION"
    }
  }, {
    "type" : "appCategories",
    "id" : "BUSINESS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BUSINESS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/BUSINESS/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BUSINESS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/BUSINESS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BUSINESS"
    }
  }, {
    "type" : "appCategories",
    "id" : "SOCIAL_NETWORKING",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SOCIAL_NETWORKING/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SOCIAL_NETWORKING/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SOCIAL_NETWORKING/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SOCIAL_NETWORKING/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SOCIAL_NETWORKING"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_STRATEGY",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_STRATEGY/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_STRATEGY/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_STRATEGY/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_STRATEGY/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_STRATEGY"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_SPORTS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_SPORTS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_SPORTS/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_SPORTS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_SPORTS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_SPORTS"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_CELEBRATIONS",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CELEBRATIONS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CELEBRATIONS/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CELEBRATIONS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CELEBRATIONS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CELEBRATIONS"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_CASUAL",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CASUAL/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CASUAL/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CASUAL/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CASUAL/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CASUAL"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_SPORTS_AND_ACTIVITIES",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_SPORTS_AND_ACTIVITIES/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_SPORTS_AND_ACTIVITIES/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_SPORTS_AND_ACTIVITIES/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_SPORTS_AND_ACTIVITIES/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_SPORTS_AND_ACTIVITIES"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_TRIVIA",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_TRIVIA/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_TRIVIA/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_TRIVIA/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_TRIVIA/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_TRIVIA"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_EATING_AND_DRINKING",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_EATING_AND_DRINKING/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_EATING_AND_DRINKING/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_EATING_AND_DRINKING/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_EATING_AND_DRINKING/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_EATING_AND_DRINKING"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_CHARACTERS",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CHARACTERS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CHARACTERS/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CHARACTERS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CHARACTERS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CHARACTERS"
    }
  }, {
    "type" : "appCategories",
    "id" : "MEDICAL",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MEDICAL/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MEDICAL/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MEDICAL/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MEDICAL/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MEDICAL"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_PUZZLE",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_PUZZLE/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_PUZZLE/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_PUZZLE/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_PUZZLE/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_PUZZLE"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_CASINO",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CASINO/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CASINO/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CASINO/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CASINO/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CASINO"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_FAMILY",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_FAMILY/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_FAMILY/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_FAMILY/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_FAMILY/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_FAMILY"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_PLACES_AND_OBJECTS",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_PLACES_AND_OBJECTS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_PLACES_AND_OBJECTS/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_PLACES_AND_OBJECTS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_PLACES_AND_OBJECTS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_PLACES_AND_OBJECTS"
    }
  }, {
    "type" : "appCategories",
    "id" : "FOOD_AND_DRINK",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FOOD_AND_DRINK/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/FOOD_AND_DRINK/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FOOD_AND_DRINK/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/FOOD_AND_DRINK/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FOOD_AND_DRINK"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_ADVENTURE",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ADVENTURE/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ADVENTURE/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ADVENTURE/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ADVENTURE/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ADVENTURE"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_BOARD",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_BOARD/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_BOARD/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_BOARD/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_BOARD/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_BOARD"
    }
  }, {
    "type" : "appCategories",
    "id" : "EDUCATION",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/EDUCATION/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/EDUCATION/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/EDUCATION/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/EDUCATION/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/EDUCATION"
    }
  }, {
    "type" : "appCategories",
    "id" : "BOOKS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BOOKS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/BOOKS/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BOOKS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/BOOKS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BOOKS"
    }
  }, {
    "type" : "appCategories",
    "id" : "SPORTS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SPORTS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SPORTS/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SPORTS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SPORTS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SPORTS"
    }
  }, {
    "type" : "appCategories",
    "id" : "FINANCE",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FINANCE/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/FINANCE/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FINANCE/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/FINANCE/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FINANCE"
    }
  }, {
    "type" : "appCategories",
    "id" : "REFERENCE",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/REFERENCE/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/REFERENCE/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/REFERENCE/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/REFERENCE/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/REFERENCE"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_RACING",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_RACING/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_RACING/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_RACING/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_RACING/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_RACING"
    }
  }, {
    "type" : "appCategories",
    "id" : "GRAPHICS_AND_DESIGN",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GRAPHICS_AND_DESIGN/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GRAPHICS_AND_DESIGN/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GRAPHICS_AND_DESIGN/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GRAPHICS_AND_DESIGN/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GRAPHICS_AND_DESIGN"
    }
  }, {
    "type" : "appCategories",
    "id" : "DEVELOPER_TOOLS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/DEVELOPER_TOOLS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/DEVELOPER_TOOLS/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/DEVELOPER_TOOLS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/DEVELOPER_TOOLS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/DEVELOPER_TOOLS"
    }
  }, {
    "type" : "appCategories",
    "id" : "HEALTH_AND_FITNESS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/HEALTH_AND_FITNESS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/HEALTH_AND_FITNESS/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/HEALTH_AND_FITNESS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/HEALTH_AND_FITNESS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/HEALTH_AND_FITNESS"
    }
  }, {
    "type" : "appCategories",
    "id" : "MUSIC",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MUSIC/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MUSIC/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MUSIC/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MUSIC/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MUSIC"
    }
  }, {
    "type" : "appCategories",
    "id" : "WEATHER",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/WEATHER/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/WEATHER/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/WEATHER/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/WEATHER/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/WEATHER"
    }
  }, {
    "type" : "appCategories",
    "id" : "TRAVEL",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/TRAVEL/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/TRAVEL/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/TRAVEL/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/TRAVEL/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/TRAVEL"
    }
  }, {
    "type" : "appCategories",
    "id" : "ENTERTAINMENT",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/ENTERTAINMENT/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/ENTERTAINMENT/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/ENTERTAINMENT/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/ENTERTAINMENT/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/ENTERTAINMENT"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_WORD",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_WORD/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_WORD/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_WORD/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_WORD/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_WORD"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_CELEBRITIES",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CELEBRITIES/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CELEBRITIES/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CELEBRITIES/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CELEBRITIES/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_CELEBRITIES"
    }
  }, {
    "type" : "appCategories",
    "id" : "LIFESTYLE",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/LIFESTYLE/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/LIFESTYLE/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/LIFESTYLE/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/LIFESTYLE/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/LIFESTYLE"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_MUSIC",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_MUSIC/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_MUSIC/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_MUSIC/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_MUSIC/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_MUSIC"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_ROLE_PLAYING",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ROLE_PLAYING/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ROLE_PLAYING/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ROLE_PLAYING/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ROLE_PLAYING/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_ROLE_PLAYING"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_MOVIES_AND_TV",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_MOVIES_AND_TV/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_MOVIES_AND_TV/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_MOVIES_AND_TV/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_MOVIES_AND_TV/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_MOVIES_AND_TV"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_CARD",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CARD/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CARD/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CARD/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CARD/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_CARD"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_ANIMALS",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_ANIMALS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_ANIMALS/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_ANIMALS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_ANIMALS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_ANIMALS"
    }
  }, {
    "type" : "appCategories",
    "id" : "MAGAZINES_AND_NEWSPAPERS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MAGAZINES_AND_NEWSPAPERS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MAGAZINES_AND_NEWSPAPERS/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MAGAZINES_AND_NEWSPAPERS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MAGAZINES_AND_NEWSPAPERS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MAGAZINES_AND_NEWSPAPERS"
    }
  }, {
    "type" : "appCategories",
    "id" : "UTILITIES",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/UTILITIES/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/UTILITIES/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/UTILITIES/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/UTILITIES/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/UTILITIES"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_FASHION",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_FASHION/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_FASHION/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_FASHION/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_FASHION/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_FASHION"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_ART",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_ART/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_ART/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_ART/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_ART/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_ART"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_GAMING",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_GAMING/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_GAMING/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_GAMING/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_GAMING/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_GAMING"
    }
  }, {
    "type" : "appCategories",
    "id" : "SHOPPING",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SHOPPING/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SHOPPING/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SHOPPING/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SHOPPING/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SHOPPING"
    }
  }, {
    "type" : "appCategories",
    "id" : "PRODUCTIVITY",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PRODUCTIVITY/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/PRODUCTIVITY/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PRODUCTIVITY/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/PRODUCTIVITY/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PRODUCTIVITY"
    }
  }, {
    "type" : "appCategories",
    "id" : "NEWS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NEWS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/NEWS/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NEWS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/NEWS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NEWS"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES_SIMULATION",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_SIMULATION/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_SIMULATION/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "GAMES"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_SIMULATION/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_SIMULATION/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES_SIMULATION"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_KIDS_AND_FAMILY",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_KIDS_AND_FAMILY/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_KIDS_AND_FAMILY/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_KIDS_AND_FAMILY/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_KIDS_AND_FAMILY/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_KIDS_AND_FAMILY"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_PEOPLE",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_PEOPLE/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_PEOPLE/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_PEOPLE/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_PEOPLE/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_PEOPLE"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS_MUSIC",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_MUSIC/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_MUSIC/subcategories"
        }
      },
      "parent" : {
        "data" : {
          "type" : "appCategories",
          "id" : "STICKERS"
        },
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_MUSIC/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_MUSIC/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS_MUSIC"
    }
  }, {
    "type" : "appCategories",
    "id" : "PHOTO_AND_VIDEO",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PHOTO_AND_VIDEO/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/PHOTO_AND_VIDEO/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PHOTO_AND_VIDEO/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/PHOTO_AND_VIDEO/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PHOTO_AND_VIDEO"
    }
  }, {
    "type" : "appCategories",
    "id" : "NAVIGATION",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NAVIGATION/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/NAVIGATION/subcategories"
        }
      },
      "parent" : {
        "data" : null,
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NAVIGATION/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/NAVIGATION/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NAVIGATION"
    }
  } ],
  "included" : [ {
    "type" : "appCategories",
    "id" : "STICKERS",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appCategories?include=parent&limit=100"
  },
  "meta" : {
    "paging" : {
      "total" : 57,
      "limit" : 100
    }
  }
}
```

### Get All Top-Level Categories that Apply to macOS Apps

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appCategories?exists[parent]=false&filter[platforms]=MAC_OS
```

**Response:**

```json
{
  "data" : [ {
    "type" : "appCategories",
    "id" : "FOOD_AND_DRINK",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FOOD_AND_DRINK/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/FOOD_AND_DRINK/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FOOD_AND_DRINK/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/FOOD_AND_DRINK/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FOOD_AND_DRINK"
    }
  }, {
    "type" : "appCategories",
    "id" : "BUSINESS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BUSINESS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/BUSINESS/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BUSINESS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/BUSINESS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BUSINESS"
    }
  }, {
    "type" : "appCategories",
    "id" : "EDUCATION",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/EDUCATION/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/EDUCATION/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/EDUCATION/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/EDUCATION/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/EDUCATION"
    }
  }, {
    "type" : "appCategories",
    "id" : "SOCIAL_NETWORKING",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SOCIAL_NETWORKING/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SOCIAL_NETWORKING/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SOCIAL_NETWORKING/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SOCIAL_NETWORKING/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SOCIAL_NETWORKING"
    }
  }, {
    "type" : "appCategories",
    "id" : "BOOKS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BOOKS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/BOOKS/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BOOKS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/BOOKS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/BOOKS"
    }
  }, {
    "type" : "appCategories",
    "id" : "SPORTS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SPORTS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SPORTS/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SPORTS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SPORTS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SPORTS"
    }
  }, {
    "type" : "appCategories",
    "id" : "FINANCE",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FINANCE/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/FINANCE/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FINANCE/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/FINANCE/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/FINANCE"
    }
  }, {
    "type" : "appCategories",
    "id" : "REFERENCE",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/REFERENCE/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/REFERENCE/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/REFERENCE/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/REFERENCE/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/REFERENCE"
    }
  }, {
    "type" : "appCategories",
    "id" : "GRAPHICS_AND_DESIGN",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GRAPHICS_AND_DESIGN/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GRAPHICS_AND_DESIGN/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GRAPHICS_AND_DESIGN/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GRAPHICS_AND_DESIGN/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GRAPHICS_AND_DESIGN"
    }
  }, {
    "type" : "appCategories",
    "id" : "DEVELOPER_TOOLS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/DEVELOPER_TOOLS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/DEVELOPER_TOOLS/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/DEVELOPER_TOOLS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/DEVELOPER_TOOLS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/DEVELOPER_TOOLS"
    }
  }, {
    "type" : "appCategories",
    "id" : "HEALTH_AND_FITNESS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/HEALTH_AND_FITNESS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/HEALTH_AND_FITNESS/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/HEALTH_AND_FITNESS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/HEALTH_AND_FITNESS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/HEALTH_AND_FITNESS"
    }
  }, {
    "type" : "appCategories",
    "id" : "MUSIC",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MUSIC/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MUSIC/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MUSIC/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MUSIC/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MUSIC"
    }
  }, {
    "type" : "appCategories",
    "id" : "WEATHER",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/WEATHER/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/WEATHER/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/WEATHER/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/WEATHER/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/WEATHER"
    }
  }, {
    "type" : "appCategories",
    "id" : "TRAVEL",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/TRAVEL/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/TRAVEL/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/TRAVEL/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/TRAVEL/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/TRAVEL"
    }
  }, {
    "type" : "appCategories",
    "id" : "ENTERTAINMENT",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/ENTERTAINMENT/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/ENTERTAINMENT/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/ENTERTAINMENT/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/ENTERTAINMENT/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/ENTERTAINMENT"
    }
  }, {
    "type" : "appCategories",
    "id" : "STICKERS",
    "attributes" : {
      "platforms" : [ "IOS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/STICKERS"
    }
  }, {
    "type" : "appCategories",
    "id" : "GAMES",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/GAMES"
    }
  }, {
    "type" : "appCategories",
    "id" : "LIFESTYLE",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/LIFESTYLE/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/LIFESTYLE/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/LIFESTYLE/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/LIFESTYLE/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/LIFESTYLE"
    }
  }, {
    "type" : "appCategories",
    "id" : "MEDICAL",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MEDICAL/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MEDICAL/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MEDICAL/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MEDICAL/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MEDICAL"
    }
  }, {
    "type" : "appCategories",
    "id" : "MAGAZINES_AND_NEWSPAPERS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MAGAZINES_AND_NEWSPAPERS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MAGAZINES_AND_NEWSPAPERS/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MAGAZINES_AND_NEWSPAPERS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/MAGAZINES_AND_NEWSPAPERS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/MAGAZINES_AND_NEWSPAPERS"
    }
  }, {
    "type" : "appCategories",
    "id" : "UTILITIES",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/UTILITIES/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/UTILITIES/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/UTILITIES/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/UTILITIES/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/UTILITIES"
    }
  }, {
    "type" : "appCategories",
    "id" : "SHOPPING",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SHOPPING/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SHOPPING/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SHOPPING/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/SHOPPING/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/SHOPPING"
    }
  }, {
    "type" : "appCategories",
    "id" : "PRODUCTIVITY",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PRODUCTIVITY/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/PRODUCTIVITY/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PRODUCTIVITY/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/PRODUCTIVITY/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PRODUCTIVITY"
    }
  }, {
    "type" : "appCategories",
    "id" : "NEWS",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NEWS/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/NEWS/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NEWS/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/NEWS/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NEWS"
    }
  }, {
    "type" : "appCategories",
    "id" : "PHOTO_AND_VIDEO",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PHOTO_AND_VIDEO/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/PHOTO_AND_VIDEO/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PHOTO_AND_VIDEO/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/PHOTO_AND_VIDEO/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/PHOTO_AND_VIDEO"
    }
  }, {
    "type" : "appCategories",
    "id" : "NAVIGATION",
    "attributes" : {
      "platforms" : [ "IOS", "MAC_OS", "TV_OS" ]
    },
    "relationships" : {
      "subcategories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NAVIGATION/relationships/subcategories",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/NAVIGATION/subcategories"
        }
      },
      "parent" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NAVIGATION/relationships/parent",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCategories/NAVIGATION/parent"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCategories/NAVIGATION"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appCategories?filter%5Bplatforms%5D=IOS&limit=100"
  },
  "meta" : {
    "paging" : {
      "total" : 26,
      "limit" : 100
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)