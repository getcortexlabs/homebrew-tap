cask "marshall-mq" do
  version "0.4.0"
  sha256 "3789294f6293a1701035471e9d231add1ce8f0792a368b9b82bcb37f31a75c18"

  url "https://pub-38b90a5d8ac141cc9de645d4e6391562.r2.dev/Marshall-MQ-#{version}.dmg",
      verified: "pub-38b90a5d8ac141cc9de645d4e6391562.r2.dev/"
  name "Marshall MQ"
  desc "Native Kafka and RabbitMQ client that reads your queues without disturbing them"
  homepage "https://getcortexlabs.com/products/marshall/"

  # The app updates itself through Sparkle; the feed is the source of truth
  # for the latest version, so livecheck reads the same appcast.
  livecheck do
    url "https://getcortexlabs.com/appcast/marshall"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Marshall MQ.app"

  # Brokers and preferences. Passwords live in the Keychain under the
  # service "marshall.cortex.brokers" and are left to the user — a zap must
  # not reach into the Keychain.
  zap trash: [
    "~/Library/Application Support/marshall.cortex",
    "~/Library/Caches/marshall.cortex.app",
    "~/Library/HTTPStorages/marshall.cortex.app",
    "~/Library/Preferences/marshall.cortex.app.plist",
  ]
end
