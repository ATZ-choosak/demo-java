mvn package # creates target/demo.war
docker-compose down
docker-compose up -d --build
