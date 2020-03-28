{% from 'icecast2/map.jinja' import icecast2 with context %}

{% if not icecast2.lookup.dist_has_ssl %}
include:
  - .repository
{% endif %}

icecast2-server-pkg:
  pkg.installed:
    - name: {{ icecast2.lookup.server }}

