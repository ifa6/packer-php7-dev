https://github.com/php/php-src:
  git.latest:
    - rev: master
    - target: /home/vagrant/php-src

buildconf-php:
  cmd.run:
    - name: buildconf
    - cwd: /home/vagrant/php-src
    - user: vagrant
    - group: vagrant
    - require:
      - git: https://github.com/php/php-src

configure-php:
  cmd.wait:
    - name: configure --enable-debug
    - cwd: /home/vagrant/php-src
    - user: vagrant
    - group: vagrant
    - watch:
      - cmd: buildconf-php

make-php:
  cmd.wait:
    - name: make
    - cwd: /home/vagrant/php-src
    - user: vagrant
    - group: vagrant
    - watch:
      - cmd: configure-php