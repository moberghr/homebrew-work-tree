class Work < Formula
  desc "Cross-platform Git worktree manager for multiple repositories"
  homepage "https://github.com/moberghr/cli-work-tree-manager"
  # Points at the published npm tarball. After `npm publish`, update both the
  # version in the URL and the sha256 (see packaging/homebrew/README.md).
  url "https://registry.npmjs.org/@moberg_hr/work-tree/-/work-tree-2.5.3.tgz"
  sha256 "6f46b72717cbf97291d62a4fb7e6c9fd8935e69f5e8d6acc7100356d5fabdae3"
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
