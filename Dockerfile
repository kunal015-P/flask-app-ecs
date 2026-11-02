FROM python:3.14 AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

###-------
#stage 2 base image

FROM python:3.14-slim

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.14/site-packages /usr/local/lib/python3.14/site-packages/

COPY . .

EXPOSE 80

CMD ["python","run.py"]


