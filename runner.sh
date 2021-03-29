#!/usr/bin/env sh
# Getting static files for Admin panel hosting!
#./manage.py collectstatic --noinput
#uwsgi --http "0.0.0.0:8010"  --chdir /code/ --module config.wsgi --master --processes 4 --threads 2 --py-autoreload=5 --static-map /static=/code/static --offload-threads 2 --stats 127.0.0.1:9191
#!/usr/bin/env sh
# Getting static files for Admin panel hosting!
# for running default dev server
#python /code/manage.py runserver_plus 0.0.0.0:8000 --insecure --cert /tmp/cert

./manage.py collectstatic --noinput
# uwsgi --http "0.0.0.0:8010" --module config.wsgi --master --processes 4 --threads 2 --static-map /static=/code/static --offload-threads 2
apt-get update
apt-get install uwsgi-plugin-python3 -y
apt-get install nginx -y
cp /code/config/mysite_nginx.conf /etc/nginx/sites-available/mysite_nginx.conf
rm /etc/nginx/sites-enabled/mysite_nginx.conf
ln -s /code/config/mysite_nginx.conf /etc/nginx/sites-enabled/mysite_nginx.conf

# uwsgi --socket "0.0.0.0:8001" --chdir /code/ --plugin-dir /usr/lib/uwsgi/plugins --plugin python3  --wsgi-file config/wsgi.py --uid 1000  --master --processes 4 --threads 2 --static-map /static=/code/static --static-map /media=/code/media --offload-threads 2 --py-autoreload 10 --stats 127.0.0.1:8010
tail -f /dev/null

