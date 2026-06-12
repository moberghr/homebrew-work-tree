class Work < Formula
  desc "Cross-platform Git worktree manager for multiple repositories"
  homepage "https://github.com/moberghr/cli-work-tree-manager"
  # Points at the published npm tarball. After `npm publish`, update both the
  # version in the URL and the sha256 (see packaging/homebrew/README.md).
  url "https://registry.npmjs.org/@moberg_hr/work-tree/-/work-tree-1.9.1.tgz"
  sha256 "5394d222ece48cb0af020deae3e6a904b752ca6c510fd035a9eeccf7190d8353"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/work --version")
  end
end
