FROM ubuntu:latest

WORKDIR /app
RUN apt-get update -y
RUN apt-get install libpq-dev python3-dev -y
RUN apt-get update -y
RUN apt-get install -y gcc
RUN apt-get install python3-pip -y
RUN apt-get install libsasl2-dev libldap2-dev libssl-dev
RUN apt-get install --no-install-recommends -y postgresql-client
RUN apt-get install npm -y
RUN npm install -g rtlcss
COPY requirements.txt requirements.txt
COPY . .
RUN pip install -r requirements.txt
EXPOSE 8069
CMD ["python3", "odoo-bin", "--addons-path=addons"]
