dpl ?= deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

VERSION_FILE := ./VERSION
VERSION := $(shell cat ${VERSION_FILE})

all:
	make env && \
	make run

env:
	set FLASK_APP=$(APP);

run: 
	flask run --host 0.0.0.0

debug:
	FLASK_APP=$(FLASK_APP) FLASK_ENV=development flask run --host 0.0.0.0

build:
	docker build -t $(APP_NAME):$(VERSION) . 
build-nc:
	docker build --no-cache -t $(APP_NAME):$(VERSION) . 
