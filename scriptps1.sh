#Telechargement des images
docker pull mariadb
docker pull phpmyadmin
docker pull wordpress
#
#Creation de l'image de mon portfolio a partir du dockerfile cree mis en place dans le TP
cd portefolio
docker build -t portfolio .
cd ..
#
#Creation reseau docker
docker network create rsxsae23

#Creation des conteneurs pour le site
docker run -d --name mariabase --restart=always -e MARIADB_ROOT_PASSWORD=passae203toor -e MARIADB_USER=me -e MARIADB_PASSWORD=sae203me -e MARIADB_DATABASE=maria -p 3306:3306 --network rsxsae23 -v ~/sae203/badowordpress:/var/lib/mysql mariadb:latest 
docker run -d --name phpmyadminbase --restart=always -e PMA_HOST=mariabase -p 9000:80 --network rsxsae23 phpmyadmin
docker run -d --name sitewordpress --restart=always -e WORDPRESS_DB_USER=me -e WORDPRESS_DB_PASSWORD=sae203me -e WORDPRESS_DB_HOST=mariabase -e WORDPRESS_DB_NAME=maria -p 80:80 --network rsxsae23 -v ~/sae203/htmlwordpress:/var/www/html wordpress
docker run -tid --name portfolio --restart=always -p 82:80 --network rsxsae23 portfolio
#
#changement proprietaire fichier config
sudo chown -R www-data:www-data ~/sae203/htmlwordpress
docker restart sitewordpress
