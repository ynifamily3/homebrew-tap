cask "nekocal" do
  version "0.1.2"
  sha256 "fab56018918492d30b2cf2149c438d1db84ef2f81221fef7a4be80c1823d6916"

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
