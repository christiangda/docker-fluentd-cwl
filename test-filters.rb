#
#
#
testStrings = [
  'redis-e5s4k_default_POD-9b4dc2daccb8381e458ac35bb686386ed4651e310cf7da2228b8dcd3271a9567.log',
  'redis-sentinel-swo64_default_sentinel-26461b4f6b4b8f3c3f484effdfd0f17400611f8753413c0dea9ebb52427eae3a.log',
  'my-nginx-2585166310-je0et_preproduction_my-nginx-40fad9274cb5902592b09259cfc41513111048badd1b303dd8db88038fc4ee3d.log',
  'rabbitmq-67i5w_preproduction_rabbitmq-c0ec1dc4acb437577aa33e8e69fccd7888a81148d3d23140975fdcf8a1eb9e5e.log',
  'wordpress_preproduction_wordpress-926f8b120115ab4d791d767753677910c9f2e6b755c40f53a64c1fe6942bf02e.log'
]

testStrings.each { |s|

  namespace     = "#{ s.split('_')[1] }"
  container_id  = "#{ s.split('_')[2].split('-')[-1].split('.')[0] }"
  service_id      = "#{ s.split('_')[2].split('-')[0..-2].join('-') }"
  replicaset_id = "#{ /\d{10}/.match( s.split('_')[0] )  }"
  pod_id        = "#{ /^[a-z0-9]{5}$/.match( s.split('_')[0].split('-')[-1] ) }"
  pod           = "#{ s.split('_')[0] }"
  replicaset    = "#{ /\-\d{10}\-[a-z0-9]{5}$/.match( s.split('_')[0] ) ? s.split('_')[0].split('-')[0..-2].join('-') : "" }"

  puts "String: #{s}"
  puts "namespace: " + namespace
  puts "container_id: " + container_id
  puts "service_id: " + service_id
  puts "replicaset_id: " + replicaset_id
  puts "pod_id: " + pod_id
  puts "pod: " + pod
  puts "replicaset: " + replicaset
  puts ""

}
