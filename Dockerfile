FROM python:3.9

# Set timezone to UTC
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt -qq update && apt -qq install -y ffmpeg wget unzip p7zip-full curl busybox aria2 tzdata

COPY . /app
WORKDIR /app
RUN chmod 777 /app

RUN wget https://rclone.org/install.sh
RUN chmod 777 ./install.sh
RUN bash install.sh

RUN pip3 install --no-cache-dir -r requirements.txt

ENV PORT=8000
EXPOSE 8000

CMD sh start.sh
