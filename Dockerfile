FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update
RUN apt-get install -y libgl1-mesa-dev
RUN pip install flask pillow keras_ocr numpy

COPY . .

EXPOSE 80
ENTRYPOINT ["python"]
CMD ["server.py"]
