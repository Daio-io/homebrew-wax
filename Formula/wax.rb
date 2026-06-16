class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.1-alpha.1/wax-0.1.1-alpha.1-aarch64-apple-darwin.tar.gz"
      sha256 "3d08b2de76c7e6f95d9d05482f12839ba7bd1ed780bd2ef7a30377d97cf48a15"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.1-alpha.1/wax-0.1.1-alpha.1-x86_64-apple-darwin.tar.gz"
      sha256 "6c6566c84f2462d9af2cba9f4866eecfd03e3b9cebb8c26be8e2ed46bd52f761"
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
