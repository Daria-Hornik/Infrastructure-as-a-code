cd /vagrant/vagrant/database
docker build -t tictactoe_db .
cd /vagrant/vagrant/backend
docker build -t tictactoe_backend .