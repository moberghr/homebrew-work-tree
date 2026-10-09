class Work < Formula
  desc "Cross-platform Git worktree manager for multiple repositories"
  homepage "https://github.com/moberghr/cli-work-tree-manager"
  # Points at the published npm tarball. After `npm publish`, update both the
  # version in the URL and the sha256 (see packaging/homebrew/README.md).
  url "https://registry.npmjs.org/@moberg_hr/work-tree/-/work-tree-2.0.9.tgz"
  sha256 "ca24526c7946f1b10dabacbd50fcbe2b728ed6378dc07080d5b83248a9558ef5"
  license "MIT"

  depends_on "node"

  def install
    # npm >= 11.19 skips dependency install scripts unless allow-listed, which
    # leaves better-sqlite3 unbuilt and node-pty's spawn-helper non-executable.
    system "npm", "install", *std_npm_args, "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/work --version")
  end
end
