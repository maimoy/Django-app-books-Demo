#!/usr/bin/env sh
# Getting static files for Admin panel hosting!
./manage.py collectstatic --noinput
#uwsgi --http "0.0.0.0:8010"  --chdir /code/ --module config.wsgi --master --processes 4 --threads 2 --py-autoreload=5 --static-map /static=/code/static --offload-threads 2 --stats 127.0.0.1:9191
#!/usr/bin/env sh
# Getting static files for Admin panel hosting!
./manage.py collectstatic --noinput
uwsgi --http "0.0.0.0:8010" --module config.wsgi --master --processes 4 --threads 2 --static-map /static=/code/static --offload-threads 2
