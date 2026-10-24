cask "typing-pet" do
  version "0.16.0"
  sha256 "298ba5d28b1b40c39d11b58589af81fab5c4e29204af1625c638a7347078e2da"

  url "https://github.com/ynifamily3/TypingPetMac/releases/download/v#{version}/TypingPetMac-v#{version}-arm64.zip"
  name "Typing Pet"
  desc "Desktop pet that reacts to keystrokes"
  homepage "https://github.com/ynifamily3/TypingPetMac"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"]

        asset_name = "TypingPetMac-#{release["tag_name"]}-arm64.zip"
        next unless release["assets"]&.any? { |asset| asset["name"] == asset_name }

        release["tag_name"]&.[](regex, 1)
      end
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "TypingPet.app"

  zap trash: [
    "~/Library/Application Support/TypingPet",
    "~/Library/Preferences/ing.miel.typingpet.plist",
  ]

  caveats <<~EOS
    Open TypingPet from Applications and follow the Input Monitoring guide
    to enable pet reactions while using other apps.
  EOS
end
