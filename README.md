# silabs-data-source

## Purpose

Vendored Silicon Labs CMSIS Device Family Packs for the
[silabs-data](https://github.com/andresv/silabs-data) project.

This repository is the upstream source-of-truth for the raw vendor data
(SVD register descriptions, device headers, and packaging metadata) that
`silabs-data` consumes when generating the `silabs-metapac` Rust crate.

## License

Pack contents are governed by the Silicon Labs Master Software License
Agreement (MSLA). See [`LICENSE-DATA.md`](./LICENSE-DATA.md) for details and a
link to the authoritative MSLA text on silabs.com.

## Fetching

The vendored packs under `packs/` are populated by `./scripts/download.sh`,
which downloads the relevant `SiliconLabs.GeckoPlatform_<FAMILY>_DFP.<VERSION>.pack`
files from `silabs.com` and verifies each against a known-good SHA256
recorded in `packs/packs.sha256`.

The download script is added in a later phase of the `silabs-data` bootstrap;
once present, the typical workflow is:

```bash
./scripts/download.sh
```

After running, `packs/` will contain the verified `.pack` archives plus the
`packs.sha256` manifest that `silabs-data-gen` reads at build time.
