class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.2.0-alpha.2/wax-0.2.0-alpha.2-aarch64-apple-darwin.tar.gz"
      sha256 "294d3c85429568aad32f35035b8d250199f3b1630aaf5eb26ba352be2aa39960"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.2.0-alpha.2/wax-0.2.0-alpha.2-x86_64-apple-darwin.tar.gz"
      sha256 "4507c664d3cdc204e99f216b684632aa1163c0846fad4ba85468ed43093d8784"
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
