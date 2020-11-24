FROM tensorflow/tensorflow:latest-gpu

RUN mkdir -p $HOME/.keras-ocr && ( \
    cd $HOME/.keras-ocr && \
    curl -L -o craft_mlt_25k.h5 https://github.com/faustomorales/keras-ocr/releases/download/v0.8.4/craft_mlt_25k.h5 && \
    curl -L -o crnn_kurapan.h5 https://github.com/faustomorales/keras-ocr/releases/download/v0.8.4/crnn_kurapan.h5 \
    )
RUN apt-get update
RUN apt-get install -y libgl1-mesa-dev
RUN pip install flask pillow keras_ocr numpy

COPY . .

EXPOSE 80
ENTRYPOINT ["python"]
CMD ["server.py"]