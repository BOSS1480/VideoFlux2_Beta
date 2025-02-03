FROM python:3.9

# הוסף כאן את הגדרת אזור הזמן לפני התקנת חבילות
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC  # הגדר את אזור הזמן ל-UTC

RUN apt -qq update && apt -qq install -y ffmpeg wget unzip p7zip-full curl busybox aria2 tzdata  # הוסף את 'tzdata' לרשימת החבילות

COPY . /app
WORKDIR /app
RUN chmod 777 /app

RUN wget https://rclone.org/install.sh
RUN chmod 777 ./install.sh
RUN bash install.sh

RUN pip3 install --no-cache-dir -r requirements.txt

ENV PORT=8000  # תיקנתי: מסירים רווחים מסביב ל-=
EXPOSE 8000

CMD sh start.sh
