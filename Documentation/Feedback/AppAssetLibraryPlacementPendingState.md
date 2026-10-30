# App Store Connect OpenAPI spec is missing PENDING in AppAssetLibraryPlacementState

Feedback ID: FB25371939  
Submitted: October 30, 2026  
Area: Developer Tools & Resources / App Store Connect API  
Type: Incorrect/Unexpected Behavior

The App Store Connect OpenAPI specification 4.5.1 omits `PENDING` from `AppAssetLibraryPlacementState`, but the live API returns that value after successful placement creation.

Observed on October 30, 2026 while uploading a screenshot and attaching it to an editable App Store version localization.

## Steps to reproduce

1. Reserve an image asset using `POST /v1/appAssetLibraryImages`, transfer its bytes using the returned upload operations, and commit the upload with `uploaded: true`.
2. Send `POST /v1/appAssetLibraryPlacements` with placement type `APP_SCREENSHOT`, a compatible placement group, the image relationship, and an editable `appStoreVersionLocalization` relationship.
3. Decode the successful response using a client generated from the published OpenAPI specification.

## Actual result

The placement creation succeeds with HTTP 201 Created, but `data.attributes.state` is `PENDING`. A client that strictly decodes `AppAssetLibraryPlacementState` rejects the response because the enum does not declare this value.

Reduced response example, with identifiers replaced by placeholders:

```json
{
  "data": {
    "type": "appAssetLibraryPlacements",
    "id": "created-placement-id",
    "attributes": {
      "mediaType": "IMAGE",
      "placementType": "APP_SCREENSHOT",
      "placementGroup": "IPAD_105_PROFILE",
      "state": "PENDING"
    }
  }
}
```

For example, the generated Swift enum in Bagbutik 24.2.2 rejects this value with a decoding error: `Invalid AppAssetLibraryPlacementState value: PENDING`.

## Expected result

`AppAssetLibraryPlacementState` should include `PENDING`. Placement state filters and documentation should use the same complete set of values. Please document the initial `PENDING` state and its transition to subsequent placement states.

## Impact

This turns a successful remote mutation into a client error. The asset and placement already exist, but the client cannot decode and record the returned placement ID. Recovery requires reconciliation; blindly retrying can create duplicate media. A local spec patch adding `PENDING` resolves the decoding failure.

Related feedback: FB25217452 reported the missing `ACTIVE` and `INACTIVE` values in this same schema. This report concerns the additional missing `PENDING` value.
