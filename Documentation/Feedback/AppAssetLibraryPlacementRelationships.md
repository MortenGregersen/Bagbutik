# App Store Connect API 4.5.1: AppAssetLibraryPlacement relationships discriminator points to a missing field

Apple Feedback: **FB25217789**, submitted October 16, 2026.

In the OpenAPI specification for App Store Connect API 4.5.1, AppAssetLibraryPlacement.properties.relationships uses oneOf with AppAssetLibraryPlacementImageRelationships and AppAssetLibraryPlacementVideoRelationships, and declares a discriminator with propertyName: mediaType.

However, successful API responses supply mediaType in the placement's attributes object, not in relationships. Generated clients therefore fail to decode successful responses because relationships.mediaType is missing.

For example, GET /v1/appAssetLibraryPlacements/{id} and the placement collection endpoints return this structure (identifiers anonymized):

```json
{
  "data": {
    "type": "appAssetLibraryPlacements",
    "id": "placement-id",
    "attributes": {
      "mediaType": "IMAGE",
      "state": "ACTIVE"
    },
    "relationships": {
      "image": {
        "data": { "type": "appAssetLibraryImages", "id": "image-id" }
      },
      "video": { "data": null }
    }
  }
}
```

The issue was reproduced on October 16, 2026 with existing screenshot and event image placements. All 17 captured collection responses fail with a missing mediaType key at data[0].relationships when using the discriminator declared by the specification. These captures include pagination responses. No app preview video placements were available to inspect.

Please correct the response schema so it describes the actual relationship object without requiring a mediaType field inside relationships. A relationships object with optional image and video linkages, alongside the localization relationships and supporting null linkage data, matches the observed payloads. Simply removing the discriminator while retaining the current permissive oneOf alternatives risks selecting the image alternative for a video payload and dropping its video relationship.

This is separate from FB25217452, which concerns the missing ACTIVE and INACTIVE placement state values. The relationship decoding failure remains after accepting those state values.
