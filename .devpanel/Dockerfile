USER root
RUN COMPOSER_HOME=/root/.config/composer composer selfupdate -n
USER ${USER}
ENV COMPOSER_HOME="${HOME}/.config/composer"
