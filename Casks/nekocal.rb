cask "nekocal" do
  version "0.1.1"
  sha256 "c33d10e05695deef872bffdc3509c2e9412951391cc5eb9a9f50b3487954beb8"

  url "https://github.com/ynifamily3/nekocal/releases/download/v#{version}/KawaiiCal-#{version}-arm64.zip"
  name "nekocal"
  desc "Cat-themed menu bar calendar with Korean localization and emoji rotation"
  homepage "https://github.com/ynifamily3/nekocal"

  depends_on arch: :arm64
  # Homebrew currently recognizes macOS releases only through Tahoe.
  # Enforce the app's actual macOS 27 minimum in preflight below.
  depends_on macos: :tahoe

  app "KawaiiCal.app"

  preflight do
    odie "nekocal requires macOS 27 or later." if MacOS.version < "27"
  end

  caveats <<~EOS
    Requires Apple Silicon and macOS 27 or later.
    The project and package are named nekocal; the installed app is currently KawaiiCal.
    Open KawaiiCal from Applications and allow Calendar access when prompted.
  EOS
end
