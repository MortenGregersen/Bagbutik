<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageVersions-_id_-deltas",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-alternativeDistributionPackageVersions-{}-deltas"
  },
  "title" : "List Deltas Information"
}
-->

# List Deltas Information

List deltas for a specific alternative distribution package version.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/deltas?limit=3
```

**Response:**

```json
{
  "data": [
    {
      "type": "alternativeDistributionPackageDeltas",
      "id": "03c62f7d-1872-4ab7-b281-dad21d6c4667",
      "attributes": {
        "url": "https://iosapps.itunes.apple.com/itunes-assets/SWDistributionArtifacts123/v4/b7/38/95/b73895aa-566b-6f4b-fd34-f2c35f643db6/mzpse.16047760955975088014.ipa?accessKey=1711774574_2934469018494581593_oCTB1GttMK4yLIv0gN2BaRzB%2BLS2yULbNTQWVf9R3eMNQ0V5lIQ6carvmAaeWrE7CPZMnDBoc9JYLx4B%2Fkda%2FtU6h8zs6G8BIeXk%2B%2FRGTo%2F5E7kUG5rG35J%2Fin6%2FzwOYya9sbZXDV4mDuTv%2Fe66PHBHyN%2FSyR%2BMCwBqct5p2GJQHEvS056r%2B3iswmxi5hAd7dh9%2FwycnKa%2F5P3aff9R0TQ%3D%3D",
        "urlExpirationDate": "2024-03-29T21:56:14-07:00",
        "alternativeDistributionKeyBlob": "Z1HWrJd3AAAABAAAAAFUYH7ql3cAAAAEAAAAAfaWTj6EhQAAAAhEmTZgM71bJFvEfIGEhQAAAAgAAAAAZbrpdWGqs9GEhQAAAAgAAAACgAlM7EDAqpNQ2wAAABCnUsumxcTbkbhEAwrDSBI8jmtHAlDbAAAA0KhMiOvhpAfSLXKeIkH/G2d4h8scGDoD6C0PjZrwx78M86VfldXjBbq7ppqbuP3A7NtYGQIfAPeUPkqwjSRgC2SPxb5Jc1T8To629hU2uivukFxAZZDeLO+tTPgAA8hpmlvZU1ylTGrKzK39HnhJ008pqy96vRg+WWTKs90sR8e1yZHMovTYNu6xH8adgOXP7EY5uD1KrczeRnF5NTB5HgkqLoYnygOKv7Sn+wswR/bKmTQSOEZm4QJT7YjJfuGodLd7By3R5B53POSjD0EjRnExOKXMUNsAAAAQhERpq5CkvNJrNdG2N6aILnZf7XBQ2wAAABBFL1hkPK8PWFWW6hDE2jtxJJC4HVDbAAAAEB0wk3p2PKbrPfuvP0gQnwBo1KUAUNsAAABQS5WilV+Av72gBlDW7cn+BsIkquQ6uHn3xzEK4kOvR2UJk257Ta7qk+/45CLr4S1JReM11d5VwKNil895Lf07lxrNYOJZ6PhVQ/G0EOeQrKwHUZI1UNsAAAAgUC+yARpDAxuAuCNvsAlg9XXgCy9Zfwv2zk4tgFTOrLIAAAAAUNsAAAAOAAAAAAAAAAAAAAAAAAA="
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageDeltas/03c62f7d-1872-4ab7-b281-dad21d6c4667"
      }
    },
    {
      "type": "alternativeDistributionPackageDeltas",
      "id": "39cd11b6-595e-42e1-b200-6d2f6c793659",
      "attributes": {
        "url": "https://iosapps.itunes.apple.com/itunes-assets/SWDistributionArtifacts123/v4/a4/47/20/a44720ab-2265-c273-7bbc-d12ed109ea85/mzpse.14148338536328657687.ipa?accessKey=1711774575_2266466619304659907_vrIsdxOvfsQ1vJYje0CDLQy%2BVki82QQOy9iGcQSRKzIOpnxPADyEOaVZsyJf4%2BoUjjeXdPrMPrK%2Frz0fvLTauDIE4IygHEkYL9UXyasbfL%2Fq98ZTFa51elRO1WMq6Xi7EI8oRIW9kzAybFQ9kgvESHibm8%2FL6tFXKJ9AZOJY%2BaNju2BiYb%2BOJL7baRVWeo51j7HMUjBT9EDwAvqOcXziSQ%3D%3D",
        "urlExpirationDate": "2024-03-29T21:56:15-07:00",
        "alternativeDistributionKeyBlob": "Z1HWrJd3AAAABAAAAAFUYH7ql3cAAAAEAAAAAfaWTj6EhQAAAAhD5lsTFiSWsVvEfIGEhQAAAAgAAAAAZbrpdWGqs9GEhQAAAAgAAAACgAlM7EDAqpNQ2wAAABDPkRhzjiURDUJlZUpdzsmejmtHAlDbAAAA0N53Lu27UewVKL6A+DF9BahpMjdo1CMCPAsfKMMaYO6zkB4QslXf2m1i7q0GlRqtvnXbxEpuKTjLrQl7ebq1BW0c1InzcgfTZIXlX55150lKbGPfO0J83lFZnoMGLJgwpHarU62GsUy9dekOD8M43tb//JDSO+ShAD7sOBKxOCac6gXRdv6srxZbWubtl61e5Od/9/ijasYYbZA8+O3xQvgFNOiFeJcalhuDhv6cZA+20mkkDMSgGUVgZg+TUYULPVYDlw3ZHA7YqRB432VkXSExOKXMUNsAAAAQC7LlwBMbbKKOEA6MUONYa3Zf7XBQ2wAAABBcCMxuc4nvghmFlyIUK91cJJC4HVDbAAAAEKNYFT9t0lpM2yeDmk23AlZo1KUAUNsAAABQs3nPxOxQD7nNBa7w0fYs9dx5ibvBYf0bdnxRWLCpUWdFl0Qb3qnLH7+aCIa/iDN0kJ1ZhvqHgj1m9TMgUjGSl4KhTUgfIRk8oRDPrG/YREEHUZI1UNsAAAAg82a1BG6wo4aMb+g69562oV/MLr0fHQRCm08Gw2Gd8SYAAAAAUNsAAAAOAAAAAAAAAAAAAAAAAAA="
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageDeltas/39cd11b6-595e-42e1-b200-6d2f6c793659"
      }
    },
    {
      "type": "alternativeDistributionPackageDeltas",
      "id": "5af83bb6-86d5-4c37-a9b6-fbdbba886f97",
      "attributes": {
        "url": "https://iosapps.itunes.apple.com/itunes-assets/SWDistributionArtifacts123/v4/7b/8a/35/7b8a35fe-160d-dacb-5cc9-f93b4571b320/mzpse.9289819572910611393.ipa?accessKey=1711774575_8696387708411185581_ASqQeARUcqua08vDe%2BFfONlua%2FaR46UlvAV5zZPWJ7Atd11J4Nc%2BXpaxNVqRaLos%2F9r4UCL5Kf3GAwhZ0BNVPAeZwspSl0nkYs29OVx%2F9E3MxgPD4CECKUE%2BtQs%2F6%2BJ6C%2FnWB5MWoi%2FnxmOCH0gFVUXe0spaRQy67fA5RxGy08FhLMYpOJjxJ9j%2B6XgunpVVvPwyohcJrSFU9oLTI0kKhg%3D%3D",
        "urlExpirationDate": "2024-03-29T21:56:15-07:00",
        "alternativeDistributionKeyBlob": "Z1HWrJd3AAAABAAAAAFUYH7ql3cAAAAEAAAAAfaWTj6EhQAAAAiHEuwn3Ooo2FvEfIGEhQAAAAgAAAAAZbrpdWGqs9GEhQAAAAgAAAACgAlM7EDAqpNQ2wAAABClfq1Ll86M5xP6AQx4R8shjmtHAlDbAAAA0P7PuAL/p4+HSKuyRT9NNzGGIEC8UFs8ndQhRgrgh7Eh/VeYSCyzkM7GnKhhIeZc++3/OmSEskTeU1Nh9SbAAgs90N1O2utr81dfSu+TrH/e06jm83a2NZorN4/Fy+7CDmsi2If5H3ZV22J+B/sIJCCORcprbHM3aZxhV9oTSMnhe/TZT//4k56o5edPWwzfECLrs+NRdkVHGCYKiGaiMBC4UQA0RzijUU0qxN5vlbjWwZFC0BLjylJ9UvxC4AMYGMHGTd/ucExK8K0S6XY6AdExOKXMUNsAAAAQC7LlwBMbbKKOEA6MUONYa3Zf7XBQ2wAAABCgREqW7e68pcp6u2JguybAJJC4HVDbAAAAELkMKmjTCMdVLgSBIwAz13do1KUAUNsAAABQ52ai2uG4ByRbZITst1sRswR+T4OzgttuvePwhhu8/u7NnZhiNFb1U4PY6D47EriuHn4Jt4TfLeLUczMmP04/yNwKwI7tqojpWjT9/ZfoZboHUZI1UNsAAAAgMzvMkXwaCm3uM3J/ttXvvAKDv1hbrL4KUyRbJzsjzlkAAAAAUNsAAAAOAAAAAAAAAAAAAAAAAAA="
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageDeltas/5af83bb6-86d5-4c37-a9b6-fbdbba886f97"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/deltas?limit=3",
    "next": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/deltas?cursor=Aw.ZasdUQ&limit=3"
  },
  "meta": {
    "paging": {
      "total": 6,
      "limit": 3
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)