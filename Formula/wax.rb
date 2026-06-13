class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.8/wax-0.1.0-alpha.8-aarch64-apple-darwin.tar.gz"
      sha256 "5c7205b2887b6ccc2e24a28f1f515a3a717e1d834ab95e12e3607596f5decc7c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.8/wax-0.1.0-alpha.8-x86_64-apple-darwin.tar.gz"
      sha256 "e95c75281405469c2713a8420d3cf4518a583939964a8ee02b6f7b84ff812e98"
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
