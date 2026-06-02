class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.2/wax-0.1.0-alpha.2-aarch64-apple-darwin.tar.gz"
      sha256 "7ad6569aa434f85451e98386b322b2abd4f235d7c3555de2fe176c92cd807693"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.2/wax-0.1.0-alpha.2-x86_64-apple-darwin.tar.gz"
      sha256 "c5103c5ae2689b7d8af5f7724a40e426ea203a2ffc7efd3a7dd53dc6b16c9313"
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
