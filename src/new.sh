if [ $# != 1 ]
then
	echo "./bin giturl"
	exit
fi

project=`basename $1|cut -d '.' -f 1`
echo "processing project $project, url:$1"

mkdir $project
cd $project
mkdir repo
mkdir data

git clone --bare $url repo
export LXR_REPO_DIR=`pwd`/repo
export LXR_DATA_DIR=`pwd`/data

echo "updating $LXR_REPO_DIR"
/usr/local/elixir/update.py 10

cd ..
