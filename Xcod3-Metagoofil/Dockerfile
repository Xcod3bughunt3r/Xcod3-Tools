FROM python:2.7.18
FROM python:3.10.4
WORKDIR /usr/bin/
RUN wget https://github.com/Xcod3bughunt3r/Xcod3-Tools/Xcod3-Metagoofil/metagoofil.py /usr/bin/
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT ["python", "metagoofil.py", "-o", "/data"]
