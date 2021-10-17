dpl ?= deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

VERSION_FILE := ./VERSION
VERSION := $(shell cat ${VERSION_FILE})

all: env venv pre-run run

venv:
	python3 -m venv .venv && \
	source .venv/bin/activate

env:
	set FLASK_APP=$(APP);

pre-run:
	pip install -r requirements/dex.txt
run: 
	flask run --host 0.0.0.0

debug:
	FLASK_APP=$(FLASK_APP) FLASK_ENV=development && \
	flask run --host 0.0.0.0

build:
	docker build -t $(APP_NAME):$(VERSION) . 
build-nc:
	docker build --no-cache -t $(APP_NAME):$(VERSION) . 
