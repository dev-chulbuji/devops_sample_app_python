APP := 'app.py'

all:
	make env && \
	make run

env:
	set FLASK_APP=$(APP);

run: 
	flask run --host 0.0.0.0

debug:
	FLASK_APP=$(APP) FLASK_ENV=development flask run --host 0.0.0.0
