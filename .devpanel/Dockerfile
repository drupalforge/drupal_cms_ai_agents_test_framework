ENV COMPOSER_HOME="${HOME}/.config/composer"

USER root
RUN composer selfupdate -n \
    && chown -R "${USER}:${GROUP}" "${COMPOSER_HOME}"
USER ${USER}
