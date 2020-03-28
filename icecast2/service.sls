{% from 'icecast2/map.jinja' import icecast2 with context %}

icecast2-service-config:
  file.managed:
    - name: /etc/systemd/system/icecast2.service
    - source: salt://icecast2/files/icecast2.service
    - template: jinja
    - mode: 755

icecast2-service:
  service.running:
    - name: icecast2
    - enable: true
    - watch:
        - pkg: icecast2-server-pkg
        - file: icecast2-config-file
