from flask import Flask, jsonify, request
from prometheus_flask_exporter import PrometheusMetrics
from random import randrange
import time


def create_app():
  app = Flask(__name__)

  metrics = PrometheusMetrics(app)
  metrics.info('app_info', 'Application info', version='1.0.0')

  metrics.register_default(
    metrics.counter(
      'by_path_counter', 'Request count by request paths',
      labels={'path': lambda: request.path}
    )
  )

  @app.route("/healthz")
  @metrics.exclude_all_metrics()
  def healthz():
    return {
      "status": 200,
      "message": "healthy"
    }

  @app.route("/hello")
  def hello():
    print("hello world")
    return jsonify({"message": "Hello world !!\n"}), 200

  @app.route("/hello/<username>")
  def hello_user(username):
    print("username: ", username)
    if username == 'slow':
      time.sleep(randrange(1, 5))
    return jsonify({"message": "Hello %s\n" % username}), 200

  return app


if __name__ == "__main__":
  app = create_app()
  app.run(host='0.0.0.0', port=8080)
