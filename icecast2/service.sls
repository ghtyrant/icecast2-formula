{% from 'icecast2/map.jinja' import icecast2 with context %}

{% if icecast2.lookup.create_service and grains['init'] == 'systemd' %}
icecast2-service-config:
  file.managed:
    - name: /etc/systemd/system/icecast2.service
    - source: salt://icecast2/files/icecast2.service
    - template: jinja
    - mode: 755
{% endif %}

{% if grains['os'] == 'Debian' %}
icecast2-init-default:
  file.replace:
    - name: {{ icecast2.lookup.init_default }}
    - pattern: 'ENABLE=false'
    - repl: 'ENABLE=true'
{% endif %}

icecast2-service:
  service.running:
    - name: icecast2
    - enable: true
    - watch:
        - pkg: icecast2-server-pkg
        - file: icecast2-config-file
