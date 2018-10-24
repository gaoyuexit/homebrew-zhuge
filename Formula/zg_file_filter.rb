# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ZgFileFilter < Formula
  desc "a simple tool to filter some name files in two directory"
  homepage "http://gaoyu.in"
  url "https://github.com/gaoyuexit/homebrew-zhuge/blob/master/zg_file_filter/zg_file_filter-1.0.0.tar.xz?raw=true"
  sha256 "76d74e2a7549711fb2ba09fc59d414fa82d79ef5922d40b907ab5fc802bf93d7"
  # depends_on "cmake" => :build

  def install
      # ENV.deparallelize  # if your formula fails when building in parallel
      bin.install "zg_file_filter"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test zg_file_filter`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
