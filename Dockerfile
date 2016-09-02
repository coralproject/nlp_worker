FROM iron/base

RUN apk update && apk upgrade \
  && apk add python3 && wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py \
&& rm -rf /var/cache/apk/*


WORKDIR /app
ADD . /app
