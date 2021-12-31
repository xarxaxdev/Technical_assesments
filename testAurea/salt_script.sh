bash_script_function () {
# Parameters: 1-SOURCE_MINION, 2-SOURCE_DB_USER, 3-SOURCE_DB_NAME,4-TIMESTAMP
echo $1
dump_output=$(sudo salt $1 cmd.run "sudo docker exec -t postgres01 pg_dump
-c --if-exists -U $2 -d $3 > /tmp/pg-dump_jenkins_$4.sql")
if [[ "${dump_output}" == *"server version mismatch"* ]]; then
echo "-------- ERROR: ${dump_output}"
echo "-------- Update the package in the QA instance!"
exit 1
fi
sudo salt $1 cmd.run "cd /tmp && tar -czvf pg-dump_jenkins_$4.sql.tar.gz
pg-dump_jenkins_$4.sql"
sudo salt $1 cmd.run "sudo rm /tmp/pg-dump_jenkins_$4.sql"
}
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
SOURCE_MINION=’localhost’
SOURCE_DB_NAME='devdb'
SOURCE_DB_USER='user'
SOURCE_DB_PASS='password'
bash_script_function ${SOURCE_MINION} ${SOURCE_DB_USER} ${SOURCE_DB_NAME} ${TIMESTAMP}
