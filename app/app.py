from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from DevOps CI/CD Pipeline!"

@app.route("/health")
def health():
    return {"status": "healthy"}

@app.route("/version")
def version():
    return {
        "application": "DevOps Demo Application",
        "version": os.getenv("APP_VERSION", "1.0")
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
