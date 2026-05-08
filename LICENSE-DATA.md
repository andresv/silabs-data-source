# License notice for vendored Silicon Labs CMSIS data

The contents of `packs/` in this repository are unmodified Silicon Laboratories
CMSIS Device Family Packs, redistributed here under the Silicon Labs Master
Software License Agreement (MSLA).

Source URL pattern:

```
https://www.silabs.com/documents/public/cmsis-packs/SiliconLabs.GeckoPlatform_<FAMILY>_DFP.<VERSION>.pack
```

The full text of the MSLA is published by Silicon Labs at:

<https://www.silabs.com/about-us/legal/master-software-license-agreement>

Each `.pack` file is a ZIP archive that retains its own embedded
`License/license.md` document. Nothing in this repository overrides or
supersedes that license; this notice exists solely to document the redistribution
rationale and to point readers at the authoritative Silicon Labs source.

## Why link instead of embed?

We deliberately do not embed the verbatim MSLA text in this repository:

- The license text on the Silicon Labs website is the authoritative version and
  may be updated by Silicon Labs without notice.
- Embedding a snapshot risks the local copy diverging from the upstream terms.
- This mirrors the approach taken by precedent projects such as
  [`cmsis-svd/cmsis-svd-data`](https://github.com/cmsis-svd/cmsis-svd-data),
  which link to vendor licenses rather than vendoring them.

## Scope

This `LICENSE-DATA.md` covers only the vendored pack contents under `packs/`.
Any tooling, scripts, or documentation in this repository that is not part of a
`.pack` file is covered separately (see `README.md`).
