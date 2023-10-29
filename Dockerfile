FROM python:3.10

RUN mkdir -p /home/app

COPY . /home/app

EXPOSE 5000

ENV NAME World

WORKDIR /home/app

RUN pip install -r requirements.txt

# Run main.py when the container launches
CMD ["python", "src/main.py"]


