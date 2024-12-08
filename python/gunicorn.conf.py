wsgi_app = "app.main:app"
bind = "0.0.0.0:8080"
workers = 8
worker_class = "uvicorn.workers.UvicornWorker"
accesslog = "-"
