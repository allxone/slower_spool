# slower_spool

# RUN
docker run -v /home/core/nyctaxi_ingest/data:/tmp/input -v /home/core/nyctaxi_ingest/ingest:/tmp/output --name slower_spool icteam/slower_spool

