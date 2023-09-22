FROM prefecthq/prefect:2-latest
WORKDIR /app

RUN ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
# RUN echo "America/Sao_Paulo" > /etc/timezone

COPY Pipfile Pipfile.lock ./
RUN pip install pipenv
RUN pipenv install
RUN pipenv run pip freeze > requirements.txt
RUN pip install -r requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

CMD ["prefect", "agent", "start", "-q", "test"]
