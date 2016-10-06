# Fluentd AWS CloudWatch Logs plugin (fluentd-cwl)

## Howto test
```script
sudo mkdir -p /var/log/fluend-cwl
docker run -t -i -v /var/log/fluend-cwl:/var/log/fluend-cwl christiangda/fluentd-cwl

#in other console
echo '{"type":"json", "message":"test1"}' | fluent-cat --host 172.17.0.2 --port 24224 debug.debug
echo '{"type":"json", "message":"test2"}' | fluent-cat --host 172.17.0.2 --port 24224 debug.debug
echo '{"type":"json", "message":"test3"}' | fluent-cat --host 172.17.0.2 --port 24224 debug.debug

ls -la /var/log/fluend-cwl/
```
