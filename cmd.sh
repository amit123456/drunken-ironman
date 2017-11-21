#!/bin/sh
clear
sudo chmod 0777 -R var pub
INPUT_DATA=$1;
ARGUMENT_DATA=$2;

case $INPUT_DATA in 
	'cflush')
		bin/magento cache:flush
		;;
	'mcmd')
		bin/magento
		;;

	'cclean')
		bin/magento cache:clean
		;;

	'cstatus')
		bin/magento cache:status
		;;

	'upgrade')
		bin/magento setup:upgrade
		;;

	'reindex')
		bin/magento indexer:reindex
		;;

	'deploy')
		bin/magento setup:static-content:deploy
		;;

	'di-compile')
		bin/magento setup:di:compile
		;;

	'mode')
		bin/magento deploy:mode:show
		;;

	'developer')
		bin/magento deploy:mode:set developer
		;;

	'production')
		bin/magento deploy:mode:set production
		;;

	'applylogorule')
		bin/magento clubcolors:apply_logorule
		;;

	'moduleenable')
		if [ $ARGUMENT_DATA ]; then
			bin/magento module:enable $ARGUMENT_DATA;
		else
			bin/magento module:enable
		fi
		;;

	'moduledisable')
		if [ $ARGUMENT_DATA ]; then
			bin/magento module:disable $ARGUMENT_DATA;
		else
			bin/magento module:disable
		fi
		;;

	'modulestatus')
		bin/magento module:status;
		;;


	*)

	echo "\n Command list\n"
	echo "cflush   		: bin/magento cache:flush"
	echo "mcmd			: bin/magento"
	echo "cclean   		: bin/magento cache:clean"
	echo "cstatus   		: bin/magento cache:status"
	echo "upgrade 		: bin/magento setup:upgrade"
	echo "deploy  		: bin/magento setup:static-content:deploy"
	echo "reindex 		: bin/magento indexer:reindex"
	echo "di-compile 		: bin/magento setup:di:compile"
	echo "mode 			: bin/magento indexer:deploy-mode:show"
	echo "developer 		: bin/magento indexer:deploy-mode:set developer"
	echo "production 		: bin/magento indexer:deploy-mode:set production"
	echo "applylogorule 		: bin/magento clubcolors:apply_logorule"
	echo "moduleenable 		: bin/magento module:enable [--modulename--]" 
	echo "moduledisable 		: bin/magento module:disable [--modulename--]" 
	echo "modulestatus 		: bin/magento module:status" 
	;;
esac;
sudo chmod 0777 -R var pub

#bin/magento