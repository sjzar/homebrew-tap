# -*- coding: utf-8 -*-

class Ips < Formula
    desc "ips is a command-line tool and library that facilitates the querying, dumping, and packaging of IP geolocation databases."
    homepage "https://github.com/sjzar/ips"
    url "https://github.com/sjzar/ips/archive/refs/tags/v0.3.0.tar.gz"
    sha256 "f0983d11bdfe23c7effcc4d185d6bd97e8badc422d11279e8831fbe92b2529a3"
    head "https://github.com/sjzar/ips.git"
  
    depends_on "go" => :build
  
    def install
      build_time = Utils.popen_read("date -u '+%Y-%m-%d %H:%M:%S %Z' 2> /dev/null").chomp
      ldflags = ["-w -s",
                 "-X \"github.com/sjzar/ips/cmd/ips.Version=v#{version}-brew\""]
      system "go", "build", "-o", bin/"ips", "-ldflags", ldflags.join(" "), "-trimpath", "main.go"
    end
  
    test do
      system bin/"ips"
    end
  end