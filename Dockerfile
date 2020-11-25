FROM tensorflow/tensorflow:latest-gpu
#FROM tensorflow/tensorflow:1.14.0-gpu
#FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt-get update
RUN apt-get install -y libgl1-mesa-dev
#RUN apt-get install -y python
#RUN apt-get install -y python-pip
RUN pip install flask pillow keras_ocr numpy

COPY . .

EXPOSE 80
ENTRYPOINT ["python"]
CMD ["server.py"]
