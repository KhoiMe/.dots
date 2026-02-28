config.load_autoconfig(False)
c.changelog_after_upgrade = 'minor'
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('colors.webpage.darkmode.enabled', True)
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language',
           '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent',
           'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

config.set('content.headers.user_agent',
           'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

config.set('content.headers.user_agent',
           'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

config.set('content.images', True, 'chrome-devtools://*')

config.set('content.images', True, 'devtools://*')

config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')

config.set('content.javascript.enabled', True, 'chrome://*/*')

config.set('content.javascript.enabled', True, 'qute://*/*')

config.set('content.local_content_can_access_remote_urls', True,
           'file:///home/tejada/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False,
           'file:///home/tejada/.local/share/qutebrowser/userscripts/*')

c.prompt.radius = 2

c.scrolling.smooth = True

c.tabs.position = 'top'

c.tabs.pinned.shrink = True

c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?hl=en&q={}'}

c.url.start_pages = 'api.quotable.io/quotes/fC5Jr2NsYm'
c.fonts.tabs.selected = 'default_size default_family'
c.fonts.web.family.standard = 'Helvetica'

c.fonts.web.family.serif = 'Cascursive'

c.fonts.web.family.cursive = 'Cascursive'

config.bind('<1>', 'tab-focus 1')
config.bind('<2>', 'tab-focus 2')
config.bind('<3>', 'tab-focus 3')
config.bind('<4>', 'tab-focus 4')
config.bind('<5>', 'tab-focus 5')
config.bind('<6>', 'tab-focus 6')
config.bind('<7>', 'tab-focus 7')
config.bind('<8>', 'tab-focus 8')
config.bind('<9>', 'tab-focus 9')
config.bind('<0>', 'tab-focus 10')
config.bind('sv', 'open -w')

config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('sH', 'config-cycle statusbar.show always never')
config.bind('T', 'hint links tab')

config.source('themes/onedark.py')

c.tabs.padding = {'top': 2, 'bottom': 2, 'left': 3, 'right': 9}
c.colors.webpage.darkmode.policy.images = 'never'

# ADBLOCK
c.content.blocking.enabled = True
c.content.blocking.method = 'adblock'

import subprocess
import os
from qutebrowser.api import interceptor

# ==== Youtube Add Blocking ==== {{{
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
     ):
        info.block()

interceptor.register(filter_yt)
