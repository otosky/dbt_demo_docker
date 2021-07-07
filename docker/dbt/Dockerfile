FROM fishtownanalytics/dbt:0.19.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-client && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash dbt
USER dbt
WORKDIR /home/dbt

COPY ./profiles.yml /home/dbt/.dbt/profiles.yml

RUN pip install \
    yamllint==1.26.1 \
    sqlfluff==0.5.2

ENTRYPOINT []
CMD ["/bin/bash"]