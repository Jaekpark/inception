#! /bin/bash

ID=jaekpark.42.fr
CNT=$(cat /etc/hosts | grep "127.0.0.1 ${ID}" | wc -l)

append()
{
	if [[ ${CNT} -eq 0 ]] ; then
		echo "127.0.0.1 ${ID}" | sudo tee -a /etc/hosts
	fi
}

delete()
{
	if [[ ${CNT} -gt 0 ]] ; then
		sudo sed -i "/127.0.0.1 ${ID}/d" /etc/hosts
	fi
}

if [ "$1" = "append" ] ; then
	append
fi

if [ "$1" = "delete" ] ; then
	delete
fi

exit 0
