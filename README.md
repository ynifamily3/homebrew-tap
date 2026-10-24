# Homebrew tap by ynifamily3

## Typing Pet for macOS

A desktop pet that reacts to keystrokes. Supports Apple Silicon Macs running macOS 13 or later.
The app is signed with Developer ID and notarized by Apple.

```sh
brew tap ynifamily3/tap
brew install --cask ynifamily3/tap/typing-pet
```

Open **TypingPet** from Applications and follow its Input Monitoring guide.
The welcome window lets you try the pet before requesting permission.

Source, releases, and installation help: [TypingPetMac](https://github.com/ynifamily3/TypingPetMac).
This tap includes the app's public prerelease channel.

## Updates

The app supports automatic updates. To update with Homebrew, quit TypingPet and run:

```sh
brew update
brew upgrade --cask --greedy ynifamily3/tap/typing-pet
```

If a manually installed app is identical to the release, `brew install --cask --adopt ynifamily3/tap/typing-pet`
can adopt it. Otherwise, keep the existing app separately before installing.

Normal uninstall preserves settings and local records. `brew uninstall --cask --zap typing-pet`
also removes TypingPet's local data and preferences.

## Maintainers

Cask versions and SHA-256 checksums are published by the app repository's guarded release pipeline:

```sh
./scripts/release.sh --homebrew
```

It verifies the public GitHub ZIP against the prepared signed release before updating this tap.
See [release automation](https://github.com/ynifamily3/TypingPetMac/blob/main/docs/RELEASE.md).

The tap intentionally follows public prereleases. CI excludes only Homebrew's
`github_prerelease_version` policy check; artifact checks, SHA-256, code signing,
notarization, and a real installation remain required.
