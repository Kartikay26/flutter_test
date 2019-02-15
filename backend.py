from flask import *

app = Flask(__name__)

# @app.route("/getwords")
# def words():
#     array = ["word"]*10
#     return jsonify({'words': array})

app.run(host="0.0.0.0", debug=True)