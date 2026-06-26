# frozen_string_literal: true

require "tmpdir"

# Formula for the wax design-system analysis CLI.
class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.2.0-alpha.4/wax-0.2.0-alpha.4-aarch64-apple-darwin.tar.gz"
      sha256 "69ea15e555717f396c735107a2aeee16c068a4b3e326da9057b4577f5ac7ee2d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.2.0-alpha.4/wax-0.2.0-alpha.4-x86_64-apple-darwin.tar.gz"
      sha256 "a2b527160f35418502f910422895a09bee431bb81655742985ab0c4c1c645148"
    end
  end

  def install
    bin.install "wax" => "wax"
  end

  def post_install
    Dir.mktmpdir("wax-language-refresh") do |repo_root|
      next if quiet_system bin/"wax", "language", "update", "--all", "--repo-root", repo_root

      opoo "Unable to refresh installed wax language packs after install. Run `wax language update --all` to retry."
    end
  rescue
    opoo "Unable to refresh installed wax language packs after install. Run `wax language update --all` to retry."
  end

  def caveats
    <<~EOS
      Language packs are not bundled with the CLI binary.

      After installing or upgrading wax, Homebrew makes a best-effort attempt
      to refresh already-installed language packs. If that refresh warns or
      cannot complete, run:
        wax language update --all

      After installing wax, run:
        wax init --non-interactive --language compose
        wax language install compose
    EOS
  end

  test do
    assert_match "wax", shell_output("#{bin}/wax --help")
  end
end
