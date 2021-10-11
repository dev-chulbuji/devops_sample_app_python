from flask import Flask

app = Flask(__name__)


@app.route("/healthz")
def healthz():
  return {
    "status": 200,
    "message": "healthy"
  }


@app.route("/hello")
def hello():
  return {
    "status": 200,
    "message": "hello world!"
  }


if __name__ == "__main__":
  app.run(host='0.0.0.0')
