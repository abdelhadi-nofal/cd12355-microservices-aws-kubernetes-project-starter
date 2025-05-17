# analytics/app.py
from flask import Flask

app = Flask(__name__)

@app.route('/api/health')
def health():
    return {"status": "healthy"}

@app.route('/api/reports/daily_usage')
def daily_usage():
    return {"data": "Mock daily usage"}

@app.route('/api/reports/user_visits')
def user_visits():
    return {"data": "Mock user visits"}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5153)
