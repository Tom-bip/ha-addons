
FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/Harky911/ReolinkANPR.git .

RUN pip install --no-cache-dir -r requirements.txt

COPY run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 5001

CMD [ "/run.sh" ]
