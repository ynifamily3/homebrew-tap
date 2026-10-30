cask "nekocal" do
  version "0.1.0"
  sha256 "49e691c977cc85b2012bb4099e1d186358f9e4188597b4e05951009d6b3b5a10"

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
