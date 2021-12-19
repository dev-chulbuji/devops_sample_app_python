import pytest

from app import create_app


@pytest.fixture(scope='session')  # 테스트 실행시 한번만 실행
def app():
  app = create_app()
  return app


@pytest.fixture
def client(app):
  client = app.test_client()
  return client


def test_hello(client):
  rtv = client.get('/hello')
  assert rtv.status_code == 200
  assert rtv.json == {"message": "Hello world !!\n"}


def test_hello_name(client):
  rtv = client.get('/hello/dj')
  assert rtv.status_code == 200
  assert rtv.json == {"message": "Hello dj\n"}