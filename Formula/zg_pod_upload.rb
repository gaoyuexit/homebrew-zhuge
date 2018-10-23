# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ZgPodUpload < Formula
  desc ""
  homepage ""
  url "https://github.com/gaoyuexit/homebrew-zg_pod_upload/blob/master/zg_pod_upload-1.0.tar.xz?raw=true"
  sha256 "cfee11072e225ac9c0941583ed55aaad3a12f1a89e1f648d6264e640ff716c33"
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
