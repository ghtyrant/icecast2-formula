{% from 'icecast2/map.jinja' import icecast2 with context %}

icecast2-server-pkg:
  pkg.installed:
    - name: {{ icecast2.lookup.server }}

