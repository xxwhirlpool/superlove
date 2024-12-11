require 'resque'
require "/home/katmac3/superlove/otwarchive/config/environment"

begin
  info=Resque.info
  sum=info[:working]+info[:pending]
  puts sum
  sleep 5
end while sum != 0
