# task-spooler shortcuts for different queues

function tsprock960
  set -lx TMPDIR /var/log/tsp/rock960d
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/rock960
  tsp
end

function tspodroidxu4_a
  set -lx TMPDIR /var/log/tsp/odroidxu4_ad
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/odroidxu4_a
  tsp
end

function tspodroidxu4_b
  set -lx TMPDIR /var/log/tsp/odroidxu4_bd
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/odroidxu4_b
  tsp
end

function tsphikey970
  set -lx TMPDIR /var/log/tsp/hikey970d
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/hikey970
  tsp
end

function tspx20
  set -lx TMPDIR /var/log/tsp/x20d
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/x20
  tsp
end

function tspztebladev8
  set -lx TMPDIR /var/log/tsp/ztebladev8d
  set -lx TS_MAXFINISHED 20
  set -lx TS_SOCKET /var/log/tsp/ztebladev8
  tsp
end

