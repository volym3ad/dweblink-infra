declare -x OVPN_ADDITIONAL_CLIENT_CONFIG
declare -x OVPN_AUTH="SHA-256"
declare -x OVPN_CIPHER="AES-256-CBC"
declare -x OVPN_CLIENT_TO_CLIENT
declare -x OVPN_CN="${domain_name}"
declare -x OVPN_COMP_LZO="0"
declare -x OVPN_DEFROUTE="${gateway_enabled}"
declare -x OVPN_DEVICE="tun"
declare -x OVPN_DISABLE_PUSH_BLOCK_DNS="0"
declare -x OVPN_DNS="1"
declare -x OVPN_ENV="/etc/openvpn/ovpn_env.sh"
declare -x OVPN_FRAGMENT
declare -x OVPN_MTU=
declare -x OVPN_NAT="1"
declare -x OVPN_OTP_AUTH
declare -x OVPN_PORT="1194"
declare -x OVPN_PROTO="udp"
declare -x OVPN_PUSH
declare -x OVPN_ROUTES
declare -x OVPN_SERVER="${network}"
declare -x OVPN_SERVER_URL="udp://${domain_name}"
declare -x OVPN_TLS_CIPHER="TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384:TLS-DHE-RSA-WITH-AES-256-CBC-SHA256"
OVPN_EXTRA_CLIENT_CONFIG+=("script-security 1")
OVPN_EXTRA_CLIENT_CONFIG+=("persist-tun")
OVPN_EXTRA_CLIENT_CONFIG+=("tls-version-min 1.2")
OVPN_EXTRA_CLIENT_CONFIG+=("verify-x509-name 'CN=${domain_name}' subject")
OVPN_EXTRA_CLIENT_CONFIG+=("remote-cert-eku 'TLS Web Server Authentication'")
