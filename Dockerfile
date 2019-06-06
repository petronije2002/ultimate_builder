FROM petronije2002/complete_builder as builder

RUN pip install --target=/install requests

FROM python:3.5-alpine as base

COPY --from=builder /usr/ /usr
COPY --from=builder /install /usr/local
ENV PYTHONPATH /usr/local
COPY --from=builder  /etc/ /etc

CMD ["/bin/sh"]
