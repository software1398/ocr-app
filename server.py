from flask import Flask, render_template, request, Response
from PIL import Image

from ocr_mlp import pred

app = Flask(__name__, template_folder="./templates/", static_url_path="/images", static_folder="images")


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/healthz", methods=["GET"])
def healthCheck():
    return "", 200


@app.route("/image", methods=['POST'])
def get_result():
    if request.method == "POST":
        try:
            source = request.form['source']

            result = pred(source)
        except Exception as e:
            print("error : %s" % e)
            return Response("fail", status=400)

    return str(result)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port='80', debug=True)
