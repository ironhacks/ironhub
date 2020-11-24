import os
from jupyter_client.localinterfaces import public_ips
# import logging

c = get_config()

c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'
c.DockerSpawner.image = 'ironhub-v2'

c.Spawner.default_url = '/lab'

# The docker instances need access to the Hub, so the default loopback port doesn't work
c.JupyterHub.hub_ip = public_ips()[0]

#c.JupyterHub.authenticator_class = 'oauthenticator.GitHubOAuthenticator'
c.JupyterHub.authenticator_class = 'oauthenticator.GoogleOAuthenticator'
c.GoogleOAuthenticator.oauth_callback_url = os.environ['OAUTH_CALLBACK_URL']
# c.GitHubOAuthenticator.oauth_callback_url = os.environ['OAUTH_CALLBACK_URL']
c.GoogleOAuthenticator.client_id = os.environ['GOOGLE_CLIENT_ID']
c.GoogleOAuthenticator.client_secret = os.environ['GOOGLE_CLIENT_SECRET']
#c.GoogleOAuthenticator.hosted_domain = "hub.<HOSTNAME>.com"
#c.GoogleOAuthenticator.login_service = "IronHacks"

#c.Authenticator.admin_users = admin = set()
c.JupyterHub.admin_access = True
c.JupyterHub.cleanup_proxy = True

c.JupyterHub.extra_log_file = '/opt/log/jupyterhub/jupyterhub.log'

#c.EventLog.handlers = [
#    logging.FileHandler('event.log'),
#]

#c.EventLog.allowed_schemas = [
#   'hub.jupyter.org/server-action'
#]

c.Authenticator.admin_users = {
    # ADD USER ACOUNTS HERE
}

c.JupyterHub.api_tokens = {
  # '<API_TOKEN>': '<USER_ACCOUNT>',
}

join = os.path.join
here = os.path.dirname(__file__)


ssl = join(here, 'ssl')
keyfile = join(ssl, 'ssl.key')
certfile = join(ssl, 'ssl.cert')

if os.path.exists(keyfile):
    c.JupyterHub.ssl_key = keyfile
if os.path.exists(certfile):
    c.JupyterHub.ssl_cert = certfile

# ALLOWS JUPYTERHUB TO RUN IN AN IFRAME
# c.NotebookApp.tornado_settings = {
#     'headers': {
#         'Content-Security-Policy': "frame-ancestors 'self' https://*.<HOSTNAME>.com http://localhost:3000; report-uri /api/security/csp-report"
#     }
# }
