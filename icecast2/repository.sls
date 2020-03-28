{% if grains['os_family'] == 'Debian' %}
xiph_media_repository:
  pkgrepo.managed:
    - humanname: Xiph.org Repository
    - name: "deb http://download.opensuse.org/repositories/multimedia:/xiph/Debian_9.0 ./"
    - file: /etc/apt/sources.list.d/icecast.list
    - gpgcheck: 1
    - key_url: http://icecast.org/multimedia-obs.key
{% endif %}
