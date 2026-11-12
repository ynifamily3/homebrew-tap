cask "nekocal" do
  version "0.1.1"
  sha256 "c33d10e05695deef872bffdc3509c2e9412951391cc5eb9a9f50b3487954beb8"

  url "https://github.com/ynifamily3/nekocal/releases/download/v#{version}/KawaiiCal-#{version}-arm64.zip"
  name "nekocal"
  desc "Cat-themed menu bar calendar with Korean localization and emoji rotation"
  homepage "https://github.com/ynifamily3/nekocal"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "KawaiiCal.app"

  caveats <<~EOS
    Requires Apple Silicon and macOS 27 or later.
    The project and package are named nekocal; the installed app is currently KawaiiCal.
    Open KawaiiCal from Applications and allow Calendar access when prompted.
  EOS
end
