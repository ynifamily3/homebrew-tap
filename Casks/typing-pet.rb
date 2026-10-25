cask "typing-pet" do
  version "0.18.1"
  sha256 "6a7708af268c6d6daf08fe34d808d9866e58e3bbba499fc4795fc1347e6fd6ca"

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
