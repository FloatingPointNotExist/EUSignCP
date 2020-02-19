export LD_LIBRARY_PATH="$PWD/Modules"

[ ! -d "venv" ] && sudo python3 -m pip install virtualenv && virtualenv -p python3 venv

source venv/bin/activate

pip install --upgrade pip

pip install -r requirements.txt

gunicorn -D -w 1 -b 0.0.0.0:5005 api:app

#ps aux | grep gunicorn | awk '{ print $2 }' | xargs kill -9
