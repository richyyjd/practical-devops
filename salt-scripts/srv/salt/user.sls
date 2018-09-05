goku:
  user.present:
    - fullname: Son Goku
    - shell: /bin/bash
    - home: /home/goku
    - groups:
      - sudo
/home/goku/.ssh:
  file.directory:
    - user: goku
    - group: goku
    - mode: 700
/home/goku/.ssh/authorized_keys:
  file:
    - managed
    - user: goku
    - group: goku
    - source: salt://keys/minion_key
    - mode: 600
