import keras_ocr

pipeline = keras_ocr.pipeline.Pipeline()


def pred(url):
    try:
        prediction_group = pipeline.recognize([url])
        result = []
        for i in prediction_group[0]:
            result.append(i[0])
        text = ', '.join(result)
    except Exception as e:
        text = e
    return text
