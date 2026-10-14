cask "winnote" do
  version "1.0.0"
  sha256 "8c1c59c9b0d5b43baba590881eda79bcaf8cd5652bdf8f7b0b923b5fa3d31930"

  url "https://github.com/CheonWoong-Park/WinNote_for_Mac/releases/download/v#{version}/notepad-#{version}.zip"
  name "WinNote for Mac"
  desc "Windows 11 Notepad, ported to macOS"
  homepage "https://github.com/CheonWoong-Park/WinNote_for_Mac"

  depends_on macos: ">= :ventura"

  app "notepad.app"

  # Apple 공증을 받지 않은 앱이라 격리 속성을 제거해야 실행됩니다.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/notepad.app"]
  end

  zap trash: [
    "~/Library/Application Support/NotepadWin",
    "~/Library/Preferences/com.cheonwoong.winnote.plist",
  ]
end
