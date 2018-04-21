require 'benchmark'
require 'benchmark/ips'

ruby = Class.new
def ruby.script
  i = 0
  while i< 30_000_000
    i += 1
  end
end

Benchmark.ips do |x|
  x.report('Ruby') { ruby.script }
end
