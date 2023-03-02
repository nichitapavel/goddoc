# task-spooler shortcuts for different queues

function tsprock960
  set -lx TMPDIR /var/log/tsp/rock960
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/rock960.socket
  tsp $argv
end

function tspodroidxu4_a
  set -lx TMPDIR /var/log/tsp/odroidxu4_a
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/odroidxu4_a.socket
  tsp $argv
end

function tspodroidxu4_b
  set -lx TMPDIR /var/log/tsp/odroidxu4_b
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/odroidxu4_b.socket
  tsp $argv
end

function tsphikey970
  set -lx TMPDIR /var/log/tsp/hikey970
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/hikey970.socket
  tsp $argv
end

function tspx20
  set -lx TMPDIR /var/log/tsp/x20
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/x20.socket
  tsp $argv
end

function tspztebladev8
  set -lx TMPDIR /var/log/tsp/ztebladev8
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/ztebladev8.socket
  tsp $argv
end
