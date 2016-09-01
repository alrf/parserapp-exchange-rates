# set path to application
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/tmp"
working_directory app_dir


# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set up socket location
listen "/tmp/unicorn.sock", :backlog => 64

# Logging
stderr_path "#{shared_dir}/unicorn.stderr.log"
stdout_path "#{shared_dir}/unicorn.stdout.log"

# Set master PID location
pid "#{shared_dir}/pids/unicorn.pid"
