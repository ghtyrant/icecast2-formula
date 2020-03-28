{% from 'icecast2/map.jinja' import icecast2 with context %}

icecast2-config-file:
  file.managed:
    - name: {{ icecast2.lookup.config }}
    - source: salt://icecast2/files/icecast.xml
    - makedirs: True
    - template: jinja
    - mode: 755

