FROM debian:latest

# Mise à jour + installation Apache, PHP et extensions
RUN apt update && apt install -y \
    apache2 \
    php \
    php-xml \
    php-mbstring \
    php-intl \
    php-mysql \
    zip \
    git \
    curl

# Installation de Composer 
RUN php -r "copy('https://getcomposer.org/installer', '/root/composer-setup.php');" \
    && php /root/composer-setup.php --install-dir=/usr/bin --filename=composer

# Installation de Lynx 
RUN apt install -y lynx

# Création du dossier du site
RUN mkdir -p /var/www/html/site

# Définition du répertoire de travail
WORKDIR /var/www/html/site

# Clone du dépôt Git
RUN git clone https://github.com/mhd7pf/myPortfolio.git .

# Installation des dépendances Symfony 
RUN composer install --no-interaction --no-progress

# Copie du fichier site.conf dans l'image
COPY site.conf /etc/apache2/sites-available/site.conf

# Activation du VirtualHost + rewrite + désactivation du défaut
RUN a2ensite site.conf \
    && a2dissite 000-default.conf \
    && a2enmod rewrite

# Exposition du port 80 dans l'image
EXPOSE 80

# Lancement d'Apache
CMD ["apachectl", "-D", "FOREGROUND"]
