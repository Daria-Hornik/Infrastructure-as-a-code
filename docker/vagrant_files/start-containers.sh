cd /vagrant/vagrant/database
docker run -d -it --name=tictactoe_db tictactoe_db
sleep 60
cd /vagrant/vagrant/backend
docker run -d -it -p 8000:8000 --add-host=tictactoe_db:$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tictactoe_db) --name=tictactoe_backend tictactoe_backend
