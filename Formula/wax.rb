class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.7/wax-0.1.0-alpha.7-aarch64-apple-darwin.tar.gz"
      sha256 "33a980e15f976ee0fb745d6fbf326af0ab7784ff34a2fef6545fed1dfffde5f9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.7/wax-0.1.0-alpha.7-x86_64-apple-darwin.tar.gz"
      sha256 "373df436c5b98735877ade45abe45368308cacbbd610fa5b5988a6a300e49108"
    end
  end

  def install
    bin.install "wax" => "wax"
  end

  def caveats
    <<~EOS
      Language packs are not bundled with the CLI binary.

      After installing wax, run:
        wax init --non-interactive --language compose
        wax language install compose
    EOS
  end

  test do
    assert_match "wax", shell_output("#{bin}/wax --help")
  end
end
