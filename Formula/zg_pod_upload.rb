# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ZgPodUpload < Formula
  desc "a simple tool for update cocoapods private repo"
  homepage "http://gaoyu.in"
  url "https://github.com/gaoyuexit/homebrew-zhuge/blob/master/zg_pod_upload/zg_pod_upload-1.1.tar.xz?raw=true"
  sha256 "51f569524e1312de6da6a6f7f9216f93af055c3d59d9d6a2e6ebcb2c0a93be2a"
  # depends_on "cmake" => :build

  def install
      # ENV.deparallelize  # if your formula fails when building in parallel
      bin.install "zg_pod_upload"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test zg_pod_upload`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
