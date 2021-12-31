whoami &&
/usr/local/bin/docker-entrypoint.sh postgres &
# /sbin/tini -- &&
cd /notebooks &&
/sbin/tini -- jupyter-notebook --allow-root 
