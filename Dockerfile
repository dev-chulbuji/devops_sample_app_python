FROM python:3.8 AS builder
COPY requirements.txt .

RUN set -xe \
	&& pip install --user -r requirements.txt

FROM python:3.8-slim
WORKDIR /app

COPY --from=builder /root/.local /root/.local
COPY ./src .

ENV PATH=/root/.local:$PATH
CMD [ "python", "./app.py" ]
