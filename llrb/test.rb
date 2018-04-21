require 'benchmark'
require 'benchmark/ips'
require 'llrb'

ruby = Class.new
def ruby.script
  i = 0
  while i< 30_000_000
    i += 1
  end
end

llrb = Class.new
def llrb.script
  i = 0
  while i< 30_000_000
    i += 1
  end
end

LLRB::JIT.compile(llrb, :script)

Benchmark.ips do |x|
  x.report('Ruby') { ruby.script }
  x.report('LLRB') { llrb.script }
  x.compare!
end
