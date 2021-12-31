import boto.ec2
import sys
# specify AWS keys
auth = {"aws_access_key_id": "accesskeyid",
        "aws_secret_access_key": "supersecretaccesskey"}


def main():
    # read arguments from the command line and
    # check whether at least two elements were entered
	if len(sys.argv) != 2 and len(sys.argv) != 3 :
		print "Usage: python python_script.py [start|reboot] instance_name\n"
		sys.exit(0)
	else:
		instance_name = sys.argv[1] if len(sys.argv) == 2 else sys.argv[2]
		reboot = len(sys.argv) == 3 and sys.argv[1] == 'reboot' 
		# Here you can add new instances
		instances = {"server1": "i-1234556778"}
	if instance_name not in instances:
		print "Invalid instance name. Available: "
		print instances.keys()
		sys.exit(0)
 
	startInstance(instances[instance_name],reboot)


def startInstance(instance_id, reboot):
	print "Starting the instance..."
	try:
		ec2 = boto.ec2.connect_to_region("eu-west-1", **auth)
	except Exception, e1:
		error1 = "Error1: %s" % str(e1)
		print(error1)
		sys.exit(0)
	try:
		if reboot:
			ec2.reboot_instances(instance_ids=instance_id)	
		else:		
			ec2.start_instances(instance_ids=instance_id)
	except Exception, e2:
		error2 = "Error2: %s" % str(e2)
		print(error2)
		sys.exit(0)


if __name__ == '__main__':
	main()
