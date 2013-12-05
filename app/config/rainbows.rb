Rainbows! do
  use :ThreadPool # concurrency model to use
  worker_connections 400
  keepalive_timeout 0 # zero disables keepalives entirely
  client_max_body_size 200*1024*1024 # 200 megabytes
  client_header_buffer_size 2 * 1024 # 2 kilobytes
end
