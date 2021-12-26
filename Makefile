dpl ?= deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

VERSION_FILE := ./VERSION
VERSION := $(shell cat ${VERSION_FILE})

all: venv local-run

venv:
	python3 -m venv .venv && \
	source .venv/bin/activate

pre-local-run:
	pip install -r requirements/dev.txt
local-run:
	FLASK_APP=$(FLASK_APP) && flask run --host 0.0.0.0 --port 8080
post-local-run:

run: pre-local-run local-run post-local-run
