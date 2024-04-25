if [ $# != 1 ]
then
	echo "./bin giturl"
	exit
fi
set -e

project=`basename $1|cut -d '.' -f 1`
echo "processing project $project, url:$1"


mkdir -p /path/elixir-data/$project
cd /path/elixir-data/$project

mkdir repo
mkdir data

git clone --bare $1 repo
git config --global --add safe.directory /path/elixir-data/$project/repo

export LXR_REPO_DIR=/path/elixir-data/$project/repo
export LXR_DATA_DIR=/path/elixir-data/$project/data

echo "updating $LXR_REPO_DIR"
/usr/local/elixir/update.py 10


cd ..
