require 'time'

module Prometheus
  class VersionFlags
    def initialize(go_source, version)
      common_version = "#{go_source}/vendor/github.com/prometheus/common/version"
      revision = `git rev-parse HEAD`.strip
      build_time = Time.now.iso8601

      @ldflags = [
        "-X #{common_version}.Version=#{version.print(false)}",
        "-X #{common_version}.Revision=#{revision}",
        "-X #{common_version}.Branch=master",
        "-X #{common_version}.BuildUser=GitLab-Omnibus",
        "-X #{common_version}.BuildDate=#{build_time}",
      ]
    end

    def print_ldflags
      @ldflags.join(' ')
    end
  end
end
